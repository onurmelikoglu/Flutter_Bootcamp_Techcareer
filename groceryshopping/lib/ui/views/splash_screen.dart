import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:groceryshopping/ui/views/bottom_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Lottie.asset("assets/lottie/animation1.json"),
        backgroundColor: Colors.white,
        nextScreen: BottomNavigation(tabIndex: 0),
        splashIconSize: 300,
        duration: 3800,
        splashTransition: SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.rightToLeftWithFade,
        animationDuration: const Duration(milliseconds: 700),
    );
  }
}
