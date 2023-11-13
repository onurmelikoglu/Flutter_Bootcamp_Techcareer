import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomFab extends StatefulWidget {
  const CustomFab({super.key});

  @override
  State<CustomFab> createState() => _CustomFabState();
}

class _CustomFabState extends State<CustomFab> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5), vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
          backgroundColor: Colors.red,
          // icon: const Icon(Icons.add, color: Colors.white,),
          // label: const Text('Compose', style: TextStyle(color: Colors.white),),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value * 2.0 * math.pi,
                child: const Icon(Icons.star, color: Colors.white,),
              );
            },
          ),
      ),
    );
  }
}
