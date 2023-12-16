import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryshopping/data/entity/yemekler.dart';
import 'package:groceryshopping/ui/cubit/fortunewheel_cubit.dart';
import 'package:groceryshopping/ui/widgets/customButton.dart';
import 'package:groceryshopping/ui/widgets/smallText.dart';
import 'package:groceryshopping/utils/colors.dart';

class FortuneWheel extends StatefulWidget {
  const FortuneWheel({super.key});

  @override
  State<FortuneWheel> createState() => _FortuneWheelState();
}

class _FortuneWheelState extends State<FortuneWheel> {
  late PageController pageController;
  int currentpage = 0;
  bool isSpinning = false;

  void startSpinning(items) {
    setState(() {
      isSpinning = true;
    });

    final random = Random();
    final randomPage = random.nextInt(items.length);

    Timer(const Duration(milliseconds: 500), () {
      pageController.animateToPage(
        randomPage,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOutCubic,
      );
      setState(() {
        isSpinning = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<FortuneWheelCubit>().yemekleriYukle();
    pageController =
        PageController(initialPage: currentpage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: smallText(
          text: "Bugün Ne Yesem",
          fontsize: 24,
          color: mediumColor,
          fontweight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlocBuilder<FortuneWheelCubit, List<Yemekler>>(
            builder: (context, yemeklerListesi) {
              if (yemeklerListesi.isNotEmpty) {
                return AspectRatio(
                  aspectRatio: 0.85,
                  child: PageView.builder(
                      controller: pageController,
                      physics: const ClampingScrollPhysics(),
                      itemCount: yemeklerListesi.length,
                      itemBuilder: (context, index) {
                        var yemek = yemeklerListesi[index];
                        return carouselView(yemek, index);
                      }),
                );
              } else {
                return const Center();
              }
            },
          ),
          BlocBuilder<FortuneWheelCubit, List<Yemekler>>(
              builder: (context, yemeklerListesi) {
            if (yemeklerListesi.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: customButton(
                  text: "Şansımı Denemek İstiyorum",
                  onPressed: () {
                    isSpinning ? null : startSpinning(yemeklerListesi);
                  },
                ),
              );
            } else {
              return const Center();
            }
          })
        ],
      ),
    );
  }

  Widget carouselView(Yemekler yemek, int index) {
    return AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          double value = 0.0;
          if (pageController.position.hasContentDimensions) {
            value = index.toDouble() - (pageController.page ?? 0);
            value = (value * 0.03).clamp(-1, 1);
          }
          return Transform.rotate(
              angle: pi * value,
              child: Column(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}"),
                              fit: BoxFit.fill),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                color: Colors.black26)
                          ]),
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: smallText(
                      text: yemek.yemek_adi,
                      fontsize: 25,
                      color: mediumColor,
                      fontweight: FontWeight.bold,
                    ),
                  )
                ],
              ));
        });
  }
}
