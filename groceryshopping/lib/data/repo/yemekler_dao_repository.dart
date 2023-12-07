import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:groceryshopping/data/entity/yemekler.dart';
import 'package:groceryshopping/data/entity/yemekler_cevap.dart';

class YemeklerDaoRepository {

  List<Yemekler> parseYemeklerCevap(String cevap, String aramaKelimesi){
    // print("Gelen Yemek : ${cevap.toString()}");
    var yemekcevap = YemeklerCevap.fromJson(json.decode(cevap)).yemekler;
    // print("Gelen Yemek : $yemekcevap");
    if(aramaKelimesi.isNotEmpty){
      List<Yemekler> yemeklerListesi = [];
      for(var yemek in yemekcevap){
        // print("Gelen Yemek : ${yemek.yemek_adi}");
        if(yemek.yemek_adi.toLowerCase().contains(aramaKelimesi.toLowerCase())){
          yemeklerListesi.add(yemek);
        }
      }
      return yemeklerListesi;
    }else{
      return yemekcevap;
    }
    // return YemeklerCevap.fromJson(json.decode(cevap)).yemekler;
  }

  Future<List<Yemekler>> yemekleriYukle() async{
    var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var cevap = await Dio().get(url);
    return parseYemeklerCevap(cevap.data.toString(), "");
  }

  Future<List<Yemekler>> yemekleriAra(String aramaKelimesi) async{
    var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var cevap = await Dio().get(url);
    // print("Kisi ara : ${cevap.data.toString()}");
    return parseYemeklerCevap(cevap.data.toString(), aramaKelimesi);
  }

}
