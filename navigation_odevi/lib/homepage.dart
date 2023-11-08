import 'package:flutter/material.dart';
import 'package:navigation_odevi/page_a.dart';
import 'package:navigation_odevi/page_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anasayfa", style: TextStyle(color: Colors.white),),
        centerTitle: true, backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PageA()));
            }, child: const Text("Git > A")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PageX()));
            }, child: const Text("Git > X")),
          ],
        ),
      ),
      backgroundColor: Colors.lightBlue,
    );
  }
}
