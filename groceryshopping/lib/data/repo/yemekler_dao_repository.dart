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
    var result = await Dio().get(url);
    try{
      var decodedData = json.decode(result.data.toString());
      return YemeklerCevap.fromJson(decodedData).yemekler;
    }catch(e){
      return [];
    }
    // return parseYemeklerCevap(cevap.data.toString());
  }

  Future<List<Yemekler>> yemekleriAra(String aramaKelimesi) async{
    var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var result = await Dio().get(url);
    try{
      var decodedData = json.decode(result.data.toString());
      var yemekResult = YemeklerCevap.fromJson(decodedData).yemekler;
      if(aramaKelimesi.isNotEmpty || yemekResult.isNotEmpty){
        List<Yemekler> yemeklerListesi = [];
        for(var yemek in yemekResult){
          if(yemek.yemek_adi.toLowerCase().contains(aramaKelimesi.toLowerCase())){
            yemeklerListesi.add(yemek);
          }
        }
        return yemeklerListesi;
      }else{
        return yemekResult;
      }
    }catch(e){
      return [];
    }
    // return parseYemeklerCevap(cevap.data.toString(), aramaKelimesi);
  }

  Future<List<Yemekler>> yemekleriFiltrele(int order, int minPrice, int maxPrice) async{
    var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var result = await Dio().get(url);
    try{
      var decodedData = json.decode(result.data.toString());
      var yemekResult = YemeklerCevap.fromJson(decodedData).yemekler;
      if(yemekResult.isNotEmpty){
        if(order > 0 && order == 1){
          yemekResult.sort((a, b) => a.yemek_adi.toString().compareTo(b.yemek_adi.toString()));
        }else if(order > 0 && order == 2){
          yemekResult.sort((a, b) => b.yemek_adi.toString().compareTo(a.yemek_adi.toString()));
        }
        return yemekResult.where((value) {
          return (int.parse(value.yemek_fiyat)>minPrice && int.parse(value.yemek_fiyat)<maxPrice);
        }).toList();
      }else{
        return yemekResult;
      }
    }catch(e){
      return [];
    }
    // print("Kisi ara : ${cevap.data.toString()}");
    // return parseYemeklerCevap(cevap.data.toString(), "");
  }

}
