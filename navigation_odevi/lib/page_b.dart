import 'package:flutter/material.dart';
import 'package:navigation_odevi/page_y.dart';

class PageB extends StatefulWidget {
  const PageB({super.key});

  @override
  State<PageB> createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sayfa B", style: TextStyle(color: Colors.white),),
        centerTitle: true, backgroundColor: Colors.black54,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.white,)),
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
      backgroundColor: Colors.black54,
    );
  }
}
