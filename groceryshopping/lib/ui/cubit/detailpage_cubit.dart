import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryshopping/data/entity/yemekler.dart';
import 'package:groceryshopping/data/repo/sepet_dao_repository.dart';

class DetailPageCubit extends Cubit<void> {
  DetailPageCubit():super(0);

  var srepo = SepetDaoRepository();

  Future<void> sepetEkle(Yemekler yemek, int yemek_siparis_adet, String kullanici_adi ) async{
    await srepo.sepetEkle(yemek, yemek_siparis_adet, kullanici_adi);
  }

}