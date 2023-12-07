import 'package:flutter/material.dart';
import 'package:groceryshopping/ui/views/bottom_navigation.dart';
import 'package:groceryshopping/ui/widgets/customButton.dart';
import 'package:groceryshopping/ui/widgets/smallText.dart';
import 'package:groceryshopping/utils/colors.dart';
import 'package:lottie/lottie.dart';

class OrderCompleteScreen extends StatefulWidget {
  const OrderCompleteScreen({super.key});

  @override
  State<OrderCompleteScreen> createState() => _OrderCompleteScreenState();
}

class _OrderCompleteScreenState extends State<OrderCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    var screenWidth = screenInfo.size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Lottie.asset('assets/lottie/animation4.json', repeat: false),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  smallText(text: "Siparişiniz Alınmıştır", fontsize: 28, color: mediumColor, fontweight: FontWeight.w600, maxlines: 2,),
                  const SizedBox(height: 10,),
                  smallText(text: "Siparişiniz en kısa sürede adresinize teslim edilecektir.", fontsize: 18, color: lightColor, maxlines: 2, textAlign: TextAlign.center,)
                ],
              ),
            ),
            const SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: customButton(
                text: "Anasayfaya Geri Dön",
                onPressed: (){
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNavigation(tabIndex: 0)),
                        (route) => false, // Remove all routes from the stack
                  );
                },
              )

            )

          ],
        ),
      ),
    );
  }
}
