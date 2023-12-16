import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryshopping/data/entity/yemekler.dart';
import 'package:groceryshopping/data/repo/yemekler_dao_repository.dart';

class FortuneWheelCubit extends Cubit<List<Yemekler>> {
  FortuneWheelCubit():super(<Yemekler>[]);

  var yrepo = YemeklerDaoRepository();

  Future<void> yemekleriYukle() async{
    var liste = await yrepo.yemekleriYukle();
    emit(liste);
  }

}