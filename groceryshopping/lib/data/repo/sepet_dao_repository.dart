import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:groceryshopping/data/entity/kullanicilar.dart';
import 'package:groceryshopping/data/entity/sepet_yemekler.dart';
import 'package:groceryshopping/data/entity/sepet_yemekler_cevap.dart';
import 'package:groceryshopping/data/entity/yemekler.dart';
import 'package:groceryshopping/data/repo/kullanicilar_dao_repository.dart';

class SepetDaoRepository {

  List<SepetYemekler> parseSepetYemeklerCevap(String cevap){
    try{
      var decodeJson = json.decode(cevap);
      return SepetYemeklerCevap.fromJson(decodeJson).sepet_yemekler;
    }catch(e){
      return [];
    }
  }

  Future<void> sepetEkle(Yemekler yemek, int yemek_siparis_adet, String kullanici_adi ) async{
    var url = "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php";
    List<SepetYemekler> sepettekiYemekler = await sepetiYukle(kullanici_adi);
    int yemekSiparisAdeti = yemek_siparis_adet;
    if(sepettekiYemekler.isNotEmpty){
      for(var sepetyemek in sepettekiYemekler){
        if(sepetyemek.yemek_adi == yemek.yemek_adi){
          yemekSiparisAdeti += int.parse(sepetyemek.yemek_siparis_adet);
          sepettenSil(kullanici_adi, int.parse(sepetyemek.sepet_yemek_id));
          break;
        }
      }
    }

    var veri = {
      "yemek_adi": yemek.yemek_adi,
      "yemek_resim_adi": yemek.yemek_resim_adi,
      "yemek_fiyat": yemek.yemek_fiyat,
      "yemek_siparis_adet": yemekSiparisAdeti,
      "kullanici_adi": kullanici_adi,
    };
    await Dio().post(url, data: FormData.fromMap(veri));
    // print("Kisi ekle : ${cevap.data.toString()}");
    // print("Sepet: $yemek_adi - $yemek_resim_adi - $yemek_fiyat - $yemek_siparis_adet - $kullanici_adi ");
  }

  Future<List<SepetYemekler>> sepetiYukle(String kullanici_adi) async{
    var url = "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php";
    var veri = { "kullanici_adi": kullanici_adi };
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    // print("Sepet : ${cevap.data.toString()}");
    return parseSepetYemeklerCevap(cevap.data.toString());
  }

  Future<void> sepettenSil(String kullanici_adi, int sepet_yemek_id) async{
    var url = "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php";
    var veri = {"kullanici_adi": kullanici_adi, "sepet_yemek_id": sepet_yemek_id };
    await Dio().post(url, data: FormData.fromMap(veri));
    // print("Kisi sil : ${cevap.data.toString()}");
  }

  Future<void> sepetiGuncelle(String kullanici_adi, SepetYemekler sepetyemek, int newQuantity) async{
    await sepettenSil(kullanici_adi, int.parse(sepetyemek.sepet_yemek_id));
    Yemekler yemek = Yemekler(yemek_id: "", yemek_adi: sepetyemek.yemek_adi, yemek_resim_adi: sepetyemek.yemek_resim_adi, yemek_fiyat: sepetyemek.yemek_fiyat);
    await sepetEkle(yemek, newQuantity, kullanici_adi);
  }

  Future<void> sepetiDetaydanGuncelle()async{

  }

  Future<void> sepetiTamamla(String kullanici_adi, List<int> tumSepetYemekIdListesi) async{
    var url = "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php";
    if(tumSepetYemekIdListesi.isNotEmpty){
      for(int i = 0; i < tumSepetYemekIdListesi.length; i++){
        var veri = {"kullanici_adi": kullanici_adi, "sepet_yemek_id": tumSepetYemekIdListesi[i] };
        await Dio().post(url, data: FormData.fromMap(veri));
      }
    }
  }

  Future<int> sepetToplamAdetAl() async{
    String currentUsername = "";
    int counter = 0;
    var krepo = KullanicilarDaoRepository();
    Kullanicilar? currentUser = await krepo.getCurrentUser();
    if(currentUser != null){
      List<SepetYemekler> sepetyemeklerListesi = await sepetiYukle(currentUser.username);
      if(sepetyemeklerListesi.isNotEmpty){
        for(int i = 0; i < sepetyemeklerListesi.length; i++){
          counter += int.parse(sepetyemeklerListesi[i].yemek_siparis_adet);
        }
        return counter;
      }else{
        return 0;
      }
    }else{
      return 0;
    }

  }

}