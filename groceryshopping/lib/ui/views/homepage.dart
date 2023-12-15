import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryshopping/data/entity/kullanicilar.dart';
import 'package:groceryshopping/data/entity/yemekler.dart';
import 'package:groceryshopping/data/repo/kullanicilar_dao_repository.dart';
import 'package:groceryshopping/data/repo/sepet_dao_repository.dart';
import 'package:groceryshopping/ui/cubit/homepage_cubit.dart';
import 'package:groceryshopping/ui/views/detailpage.dart';
import 'package:groceryshopping/ui/widgets/customButton.dart';
import 'package:groceryshopping/ui/widgets/smallText.dart';
import 'package:groceryshopping/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var srepo = SepetDaoRepository();
  var krepo = KullanicilarDaoRepository();
  bool isLoading = false;
  String currentUserName = "";
  String greetings = "Merhaba";
  ScrollController scrollController = ScrollController();
  double minPrice = 0.0;
  double maxPrice = 1000.0;
  int? seciliFiltre = 0;

  Future<void> karsilamaMetniGuncelleme() async{
    Timer.periodic(const Duration(seconds: 5), (timer) {
      karsilamaMetniAl();
    });
  }

  Future<void> karsilamaMetniAl() async{
    var now = DateTime.now();
    var formatter = DateFormat('HH:mm');
    formatter.format(now);
    if(currentUserName.isNotEmpty){
      setState(() {
        if (now.hour >= 6 && now.hour < 12) {
          greetings = "Günaydın, $currentUserName";
        } else if (now.hour >= 12 && now.hour < 18) {
          greetings = "Tünaydın, $currentUserName";
        } else {
          greetings = "İyi Akşamlar, $currentUserName";
        }
      });
    }
  }

  Future<void> getCurrentUser() async{
    Kullanicilar? currentUser = await krepo.getCurrentUser();
    if(currentUser != null){
      currentUserName = currentUser.username;
    }
  }

  Future<void> checkFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('firstLaunch') ?? true;
    if (isFirstLaunch) {
      isLoading = true;
      Future.delayed(const Duration(milliseconds: 1200), () {
        setState(() { isLoading = false; });
      });
      await prefs.setBool('firstLaunch', false);
    }
  }

  Future<void> scrollListener() async {
    if (scrollController.offset <= scrollController.position.minScrollExtent &&
        !scrollController.position.outOfRange) {
      // At the top of the page, prevent bouncing effect
      scrollController.position.didEndScroll();
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    getCurrentUser().then((value){
      karsilamaMetniAl();
    });
    // karsilamaMetniGuncelleme();
    context.read<HomepageCubit>().yemekleriYukle();
    checkFirstLaunch();
  }

  @override
  Widget build(BuildContext context) {

    var screenInfo = MediaQuery.of(context);
    var screenWidth = screenInfo.size.width;
    // var screenHeight = screenInfo.size.height;

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: false,
            backgroundColor: primaryColor,
            centerTitle: false,
            title: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: smallText(text: greetings, fontsize: 24, color: Colors.white, fontweight: FontWeight.w600,),
            ),),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          color: Colors.transparent,
                          height: 150,
                          width: screenWidth,
                          child: CustomPaint(
                            painter: CurvePainter(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: TextField(
                                      onChanged: (aramaKelimesi) {
                                        context.read<HomepageCubit>().yemekleriAra(aramaKelimesi);
                                      },
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.search, color: lightColor,),
                                        hintText: "Canınız ne çekti ?",
                                        hintStyle: TextStyle(color: lightColor),
                                        fillColor: Colors.white,
                                        filled: true,
                                        contentPadding: const EdgeInsets.symmetric(vertical: 2),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.white, width: 0.0),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.white, width: 0.0),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15,),
                                  GestureDetector(
                                      onTap: (){
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context){
                                              return StatefulBuilder(
                                                builder: (context,state) {
                                                  return SizedBox(
                                                    width: screenWidth,
                                                    height: 400,
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              smallText(text: "Filtrele", fontsize: 22, color: mediumColor,fontweight: FontWeight.w600,),
                                                              IconButton(
                                                                  onPressed: (){
                                                                    Navigator.pop(context);
                                                                  },
                                                                  icon: Icon(Icons.close, size: 28, color: mediumColor)
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        const Divider(),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 15, right: 15),
                                                          child: Column(
                                                            children: [
                                                              smallText(text: "Sıralama", fontsize: 16, color: mediumColor, fontweight: FontWeight.w600,),
                                                              const SizedBox(height: 10,),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                children: [
                                                                  ChoiceChip(
                                                                    backgroundColor: Colors.white,
                                                                    padding: const EdgeInsets.only(bottom: 0.1),
                                                                    label: smallText(text: "A > Z", fontsize: 12, fontweight: FontWeight.bold, color: seciliFiltre == 1 ? primaryColor : Colors.grey),
                                                                    //labelStyle: TextStyle( color: seciliFiltre == index ? Colors.orange : Colors.grey),
                                                                    side: BorderSide(color: seciliFiltre == 1 ? primaryColor: Colors.grey.shade300),
                                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                                    selected: seciliFiltre == 1,
                                                                    showCheckmark: false,
                                                                    selectedColor: Colors.white,
                                                                    onSelected: (bool selected) {
                                                                      state((){});
                                                                      setState(() {
                                                                        seciliFiltre = selected ? 1 : null;
                                                                        print("selected: $seciliFiltre");
                                                                      });
                                                                    },
                                                                  ),
                                                                  ChoiceChip(
                                                                    backgroundColor: Colors.white,
                                                                    padding: const EdgeInsets.only(bottom: 0.1),
                                                                    label: smallText(text: "Z > A", fontsize: 12, fontweight: FontWeight.bold, color: seciliFiltre == 2 ? primaryColor : Colors.grey),
                                                                    //labelStyle: TextStyle( color: seciliFiltre == index ? Colors.orange : Colors.grey),
                                                                    side: BorderSide(color: seciliFiltre == 2 ? primaryColor: Colors.grey.shade300),
                                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                                    selected: seciliFiltre == 2,
                                                                    showCheckmark: false,
                                                                    selectedColor: Colors.white,
                                                                    onSelected: (bool selected) {
                                                                      state((){});
                                                                      setState(() {
                                                                        seciliFiltre = selected ? 2 : null;
                                                                        print("selected: $seciliFiltre");
                                                                      });
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                              const Divider(),
                                                              smallText(text: "Fiyat Aralığı", fontsize: 16, color: mediumColor, fontweight: FontWeight.w600,),
                                                              const SizedBox(height: 10,),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                children: [
                                                                  Chip(label: Text("${minPrice.toInt().toString()} ₺")),
                                                                  Chip(label: Text("${maxPrice.toInt().toString()} ₺")),
                                                                ],
                                                              ),
                                                              RangeSlider(
                                                                values: RangeValues(minPrice, maxPrice),
                                                                labels: RangeLabels(minPrice.toString(), maxPrice.toString()),
                                                                min: 0.0,
                                                                max: 1000.0,
                                                                onChanged: (RangeValues values) {
                                                                  state((){});
                                                                  setState(() {
                                                                    minPrice = values.start;
                                                                    maxPrice = values.end;
                                                                  });
                                                                },
                                                              ),
                                                              customButton(text: "Onayla", onPressed: (){
                                                                context.read<HomepageCubit>().yemekleriFiltrele(seciliFiltre ?? 0, minPrice.toInt(), maxPrice.toInt()).then((value){
                                                                  Navigator.pop(context);
                                                                });
                                                              },)
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                }
                                              );
                                            }
                                        );
                                      },
                                      child: const Icon(Icons.filter_alt_rounded, color: Colors.white, size: 32,)
                                  )
                                ],
                              ),
                              const SizedBox(height: 15,),
                              currentUserName == "" ? const Center(): Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.location_on, color: Colors.white,),
                                    smallText(text: "Evim", fontsize: 16, color: Colors.white)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          smallText(text: "Ürünler", fontsize: 20, color: mediumColor, fontweight: FontWeight.w600,),
                          BlocBuilder<HomepageCubit,List<Yemekler>>(
                              builder: (context, yemeklerListesi){
                                if(yemeklerListesi.isNotEmpty){
                                  return GridView.builder(
                                    controller: scrollController,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount: yemeklerListesi.length,
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1 / 1.48,
                                        crossAxisSpacing: 18.2,
                                        mainAxisSpacing: 18.2
                                    ),
                                    itemBuilder: (context, index){
                                      var yemek = yemeklerListesi[index];
                                      return GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(
                                              builder: (context) => DetailPage(yemek: yemek)))
                                              .then((value){
                                            context.read<HomepageCubit>().yemekleriYukle();
                                          });
                                        },
                                        child: isLoading ?  Shimmer.fromColors(
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[100]!,
                                            child: productCard(yemek: yemek),
                                        ):
                                        productCard(yemek: yemek),
                                      );
                                    },
                                  );
                                }else{
                                  return productCardShimmer();
                                }
                              }
                          )
                        ],
                      ),
                    )
                  ],
                );
              }, childCount: 1),
          )
        ],
      ),
    );
  }
}

class productCardShimmer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: greyColor, width: 0.8),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}


class productCard extends StatelessWidget {
  Yemekler yemek;
  productCard({required this.yemek});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: greyColor, width: 0.8),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SizedBox(
        height: 400,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
              child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  smallText(text: yemek.yemek_adi, fontsize: 18, fontweight: FontWeight.w600, color: mediumColor),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      smallText(text: "${yemek.yemek_fiyat} ₺", fontsize: 18, fontweight: FontWeight.w600, color: mediumColor),
                      SizedBox(
                        width:40,
                        height:40,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute( builder: (context) => DetailPage(yemek: yemek))).then((value){
                              context.read<HomepageCubit>().yemekleriYukle();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            backgroundColor: primaryColor,
                            padding: const EdgeInsets.all(2),
                          ),
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}


class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = primaryColor;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.76);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.76);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

