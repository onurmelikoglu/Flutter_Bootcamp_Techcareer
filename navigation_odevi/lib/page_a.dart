import 'package:flutter/material.dart';
import 'package:navigation_odevi/page_b.dart';

class PageA extends StatefulWidget {
  const PageA({super.key});

  @override
  State<PageA> createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sayfa A", style: TextStyle(color: Colors.black),),
        centerTitle: true, backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PageB()));
            }, child: const Text("Git > B"))
          ],
        ),
      ),
      backgroundColor: Colors.orangeAccent,
    );
  }
}
