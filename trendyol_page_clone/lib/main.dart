import 'package:flutter/material.dart';
import 'package:trendyol_page_clone/ui/views/populer_urunler_sayfa.dart';
import 'package:trendyol_page_clone/ui/views/test_sayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const PopulerUrunlerSayfa(),
    );
  }
}
