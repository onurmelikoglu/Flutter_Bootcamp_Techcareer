import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryshopping/data/entity/yemekler.dart';
import 'package:groceryshopping/data/repo/yemekler_dao_repository.dart';

class HomepageCubit extends Cubit<List<Yemekler>> {
  HomepageCubit():super(<Yemekler>[]);

  var krepo = YemeklerDaoRepository();

  Future<void> yemekleriYukle() async{
    var liste = await krepo.yemekleriYukle();
    emit(liste);
  }

  Future<void> yemekleriAra(String aramaKelimesi) async{
    var liste = await krepo.yemekleriAra(aramaKelimesi);
    emit(liste);
  }

}