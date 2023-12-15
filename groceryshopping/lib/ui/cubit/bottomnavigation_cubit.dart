import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryshopping/data/repo/sepet_dao_repository.dart';

class BottomNavigationCubit extends Cubit<int> {
  BottomNavigationCubit():super(0);

  var srepo = SepetDaoRepository();

  Future<void> sepetToplamAdetAl() async{
    int sepetToplamAdet = await srepo.sepetToplamAdetAl();
    emit(sepetToplamAdet);
  }

}