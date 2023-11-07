import 'package:flutter/material.dart';

class KullaniciEtkilesimiSayfa extends StatefulWidget {
  const KullaniciEtkilesimiSayfa({super.key});

  @override
  State<KullaniciEtkilesimiSayfa> createState() => _KullaniciEtkilesimiSayfaState();
}

class _KullaniciEtkilesimiSayfaState extends State<KullaniciEtkilesimiSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kullanıcı Etkileşimi"), ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  content: const Text("Silmek İstiyor musunuz ?"),
                  action: SnackBarAction(label: "Evet", onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: const Text("Silindi"))
                    );
                  }),
                )
              );
            }, child: const Text("Snackbar")),
            ElevatedButton(onPressed: (){

            }, child: const Text("Snackbar (Özel)")),
            ElevatedButton(onPressed: (){

            }, child: const Text("Alert")),
            ElevatedButton(onPressed: (){

            }, child: const Text("Alert (Özel)")),
          ],
        ),
      ),
    );
  }
}
