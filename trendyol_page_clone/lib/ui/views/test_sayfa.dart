import 'package:flutter/material.dart';

class TestSayfa extends StatefulWidget {
  const TestSayfa({super.key});

  @override
  State<TestSayfa> createState() => _TestSayfaState();
}

class _TestSayfaState extends State<TestSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("deneme"),),
      body: const Center(),
    );
  }
}
