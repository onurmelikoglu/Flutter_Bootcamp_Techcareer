import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryshopping/data/entity/yemekler.dart';
import 'package:groceryshopping/data/repo/yemekler_dao_repository.dart';

class HomepageCubit extends Cubit<List<Yemekler>> {
  HomepageCubit():super(<Yemekler>[]);

  var yrepo = YemeklerDaoRepository();

  Future<void> yemekleriYukle() async{
    var liste = await yrepo.yemekleriYukle();
    emit(liste);
  }

  Future<void> yemekleriAra(String aramaKelimesi) async{
    var liste = await yrepo.yemekleriAra(aramaKelimesi);
    emit(liste);
  }

  Future<void> yemekleriFiltrele(int order, int minPrice, int maxPrice) async{
    var liste = await yrepo.yemekleriFiltrele(order, minPrice, maxPrice);
    emit(liste);
  }

}