import 'package:flutter/material.dart';
import 'package:listeleme_kullanimi/urunler_app/data/entity/urunler.dart';

class UrunlerDetaySayfa extends StatefulWidget {

  Urunler urun;
  UrunlerDetaySayfa({required this.urun});

  @override
  State<UrunlerDetaySayfa> createState() => _UrunlerDetaySayfaState();
}

class _UrunlerDetaySayfaState extends State<UrunlerDetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.urun.ad),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.urun.resim}"),
            Text("${widget.urun.fiyat} ₺", style: const TextStyle(fontSize: 50),)
          ],
        ),
      ),
    );
  }
}
