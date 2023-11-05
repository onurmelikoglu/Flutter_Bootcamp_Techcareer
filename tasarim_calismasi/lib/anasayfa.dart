import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasarim_calismasi/renkler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    var d = AppLocalizations.of(context)!;

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    print("Ekran Yuksekligi : $ekranYuksekligi");
    print("Ekran Genisligi : $ekranGenisligi");

    return Scaffold(
      appBar: AppBar(
        title: Text("Pizza",style: TextStyle(color: yaziRenk1, fontFamily: "Pacifico", fontSize: 22),),
        centerTitle: true,
        backgroundColor: anaRenk,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(d.pizzaBaslik, style: TextStyle(fontSize: ekranGenisligi/12, color: anaRenk, fontWeight: FontWeight.bold),),
          Image.asset("resimler/pizza.png"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Chip(title: d.peynirYazi,),
              Chip(title: d.sucukYazi,),
              Chip(title: d.zeytinYazi,),
              Chip(title: d.biberYazi,),
            ],
          ),
          Column(
            children: [
              Text(d.teslimatSure, style: TextStyle(fontSize: 22, color: yaziRenk2, fontWeight: FontWeight.bold),),
              Text(d.teslimatBaslik, style: TextStyle(fontSize: 22, color: anaRenk, fontWeight: FontWeight.bold),),
              Padding(
                padding: EdgeInsets.only(left: ekranGenisligi/20, right: ekranGenisligi/20),
                child: Text(d.pizzaAciklama,
                  style: TextStyle(fontSize: 22, color: yaziRenk2),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(d.fiyatYazi, style: TextStyle(color: anaRenk, fontSize: 44, fontWeight: FontWeight.bold),),
                Spacer(),
                SizedBox(
                  width: ekranGenisligi/2,
                  height: 50,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: anaRenk,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          )
                      ),
                      onPressed: (){},
                      child: Text(
                        d.buttonYazi,
                        style: TextStyle(color: yaziRenk1, fontSize: 18),
                      ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Chip extends StatelessWidget {
  String title;

  Chip({required this.title});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){},
      style: TextButton.styleFrom(backgroundColor: anaRenk),
      child: Text(title, style: TextStyle(color: yaziRenk1)),
    );
  }
}

