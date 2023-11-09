import 'package:flutter/material.dart';

class KullaniciEtkilesimiSayfa extends StatefulWidget {
  const KullaniciEtkilesimiSayfa({super.key});

  @override
  State<KullaniciEtkilesimiSayfa> createState() => _KullaniciEtkilesimiSayfaState();
}

class _KullaniciEtkilesimiSayfaState extends State<KullaniciEtkilesimiSayfa> {

  var tfControl = TextEditingController();

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
                        const SnackBar(content:  Text("Silindi"))
                    );
                  }),
                )
              );
            }, child: const Text("Snackbar")),
            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Silmek İstiyor musunuz ?", style: TextStyle(
                      color: Colors.indigoAccent
                    ),),
                    backgroundColor: Colors.white,
                    action: SnackBarAction(label: "Evet", textColor: Colors.red, onPressed: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:  Text("Silindi",style: TextStyle(color: Colors.red)),
                            backgroundColor: Colors.white,
                          )
                      );
                    }),
                  )
              );
            }, child: const Text("Snackbar (Özel)")),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("Başlık"),
                      content: Text("İçerik"),
                      actions: [
                        TextButton(onPressed: (){
                            print("İptal seçildi");
                            Navigator.pop(context);
                        }, child: Text("İptal")),
                        TextButton(onPressed: (){
                            print("Tamam Seçildi");
                            Navigator.pop(context);
                        }, child: Text("Tamam")),
                      ],
                    );
                  }
              );
            }, child: const Text("Alert")),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("Kayıt İşlemi"),
                      content: TextField(
                        controller: tfControl,
                        decoration: const InputDecoration(hintText: "Veri"),
                      ),
                      backgroundColor: Colors.grey,
                      actions: [
                        TextButton(onPressed: (){
                          print("İptal seçildi");
                          Navigator.pop(context);
                        }, child: Text("İptal", style: TextStyle(color: Colors.black),)),
                        TextButton(onPressed: (){
                          print("Kaydet Seçildi");
                          Navigator.pop(context);
                          String alinanVeri = tfControl.text;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(alinanVeri))
                          );
                          tfControl.text = "";
                        }, child: Text("Kaydet", style: TextStyle(color: Colors.black),)),
                      ],
                    );
                  }
              );
            }, child: const Text("Alert (Özel)")),
          ],
        ),
      ),
    );
  }
}
