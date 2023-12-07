import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryshopping/data/repo/kullanicilar_dao_repository.dart';

class UserProfileCubit extends Cubit<void> {
  UserProfileCubit():super(0);

  var krepo = KullanicilarDaoRepository();

  Future<void> signOut() async{
    await krepo.signOut();
  }
}