import 'package:flutter/material.dart';

class PageY extends StatefulWidget {
  const PageY({super.key});

  @override
  State<PageY> createState() => _PageYState();
}

class _PageYState extends State<PageY> {

  Future<bool> turnBackButton(BuildContext context)async {
    Navigator.of(context).popUntil((route) => route.isFirst);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sayfa Y", style: TextStyle(color: Colors.white),),
        centerTitle: true, backgroundColor: Colors.amber,
        leading: IconButton(onPressed: (){
          Navigator.of(context).popUntil((route) => route.isFirst);
        }, icon: const Icon(Icons.arrow_back, color: Colors.white,)),
      ),
      body: WillPopScope(
        onWillPop: () => turnBackButton(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.of(context).popUntil((route) => route.isFirst);
              }, child: const Text("Git > Anasayfa"))
            ],
          ),
        ),
      ),
      backgroundColor: Colors.amber,
    );
  }
}
