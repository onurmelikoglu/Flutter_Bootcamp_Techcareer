import 'package:calisma_yapisi/kisiler.dart';
import 'package:calisma_yapisi/sonuc_ekrani.dart';
import 'package:flutter/material.dart';

class OyunEkrani extends StatefulWidget {

  Kisiler kisi;

  OyunEkrani({required this.kisi});

  @override
  State<OyunEkrani> createState() => _OyunEkraniState();
}
// leading - left - start
// trailing - right - end
class _OyunEkraniState extends State<OyunEkrani> {

  Future<bool> geriDonusTusu(BuildContext context)async {
    print("Navigation geri dönüş tuşu seçildi");
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Oyun Ekranı"),
        leading: IconButton(onPressed: (){
          print("App Bar Geri Tuşu Seçildi");
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: WillPopScope(
        onWillPop: () => geriDonusTusu(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${widget.kisi.ad} - ${widget.kisi.yas} - ${widget.kisi.boy} - ${widget.kisi.bekar}"),
              ElevatedButton(
                  onPressed: (){
                    // pushReplacement : backstack ten state i siler ve geri dön denildiğinde state olmadığı için bi önceki state döner
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => const SonucEkrani()));
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SonucEkrani()));
                  },
                  child: const Text("Bitti")
              )
            ],
          ),
        ),
      ),
    );
  }
}
