import 'package:flutter/material.dart';
import 'package:navigation_odevi/page_y.dart';

class PageX extends StatefulWidget {
  const PageX({super.key});

  @override
  State<PageX> createState() => _PageXState();
}

class _PageXState extends State<PageX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sayfa X", style: TextStyle(color: Colors.white),),
        centerTitle: true, backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PageY()));
            }, child: const Text("Git > Y"))
          ],
        ),
      ),
      backgroundColor: Colors.grey,
    );
  }
}
