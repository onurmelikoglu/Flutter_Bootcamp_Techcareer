import 'package:calisma_yapisi/kisiler.dart';
import 'package:calisma_yapisi/oyun_ekrani.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  
  int sayac = 0;
  bool kontrol = false;

  @override
  void initState(){
    super.initState();
    print("initState Çalıştı");
    // Uygulama açıldığında bir kere çalışır
  }

  Future<int> toplama(int sayi1, int sayi2) async{
    int toplam = sayi1 + sayi2;
    return toplam;
  }

  Widget build(BuildContext context) {
    print("build methodu calisti"); // Tekrarlı çalışır, her setState methodu çalıştığında
    return Scaffold(
      appBar: AppBar(title: const Text("Anasayfa"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Sonuç : $sayac"),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    sayac = sayac + 1;
                  });
                },
                child: const Text("Tıkla")
            ),
            ElevatedButton(
                onPressed: (){
                  var kisi = Kisiler(ad: "Ahmet", yas: 30, boy: 1.78, bekar: true);
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      OyunEkrani(kisi: kisi)))
                      .then((value) => { print("Anasayfaya Dönüldü") });
                },
                child: const Text("Basla")
            ),
            Visibility(visible: kontrol, child: const Text("Merhaba")),
            Text(kontrol ? "Merhaba":"GüleGüle", style: TextStyle(color: kontrol ? Colors.blue:Colors.red),),
            ((){
              if(kontrol){
                return const Text("Merhaba", style: TextStyle(color: Colors.blue),);
              }else{
                return const Text("Bay Bay", style: TextStyle(color: Colors.red),);
              }
            }()),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    kontrol = true;
                  });
                },
                child: const Text("Durum1 (True)")
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    kontrol = false;
                  });
                },
                child: const Text("Durum2 (False)")
            ),
            FutureBuilder<int>(
              future: toplama(10, 20),
              builder: (context,snapshot){
                if(snapshot.hasError){
                  return const Text("Hata Oluştu");
                }
                if(snapshot.hasData){
                  return Text("Sonuc : ${snapshot.data}");
                }else{
                  return const Text("Sonuç Yok");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
