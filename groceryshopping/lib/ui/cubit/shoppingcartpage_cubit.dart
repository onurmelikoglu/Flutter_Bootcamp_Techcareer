import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryshopping/data/entity/sepet_yemekler.dart';
import 'package:groceryshopping/data/repo/sepet_dao_repository.dart';

class ShoppingCartPageCubit extends Cubit<List<SepetYemekler>> {
  ShoppingCartPageCubit():super(<SepetYemekler>[]);

  var srepo = SepetDaoRepository();
  String currentUserName = "";

  Future<void> sepetiYukle(String currentUserName) async{
    var liste = await srepo.sepetiYukle(currentUserName);
    emit(liste);
  }

  Future<void> sepettenSil(String currentUserName, int sepet_yemek_id) async{
    await srepo.sepettenSil(currentUserName, sepet_yemek_id);
  }

  Future<void> sepetiGuncelle(String currentUserName, SepetYemekler sepetyemek, int newQuantity) async{
    await srepo.sepetiGuncelle(currentUserName, sepetyemek, newQuantity);
  }

  Future<void> sepetiTamamla(String currentUserName,List<int> tumSepetYemekIdListesi) async{
    await srepo.sepetiTamamla(currentUserName, tumSepetYemekIdListesi);
  }

}