import 'package:bloc_kullanimi/matematik_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<int>{
  AnasayfaCubit():super(0); // Varsayılan değer

  var mrepo = MatematikRepository();

  void topla(String alinanSayi1, String alinanSayi2){
    int toplam = mrepo.topla(alinanSayi1, alinanSayi2);
    emit(toplam); // Tetikleme veya veri gönderme
  }

  void carp(String alinanSayi1, String alinanSayi2){
    int carpma = mrepo.carp(alinanSayi1, alinanSayi2);
    emit(carpma);
  }
}