import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryshopping/data/repo/kullanicilar_dao_repository.dart';

class LoginPageCubit extends Cubit<void> {
  LoginPageCubit():super(0);

  var krepo = KullanicilarDaoRepository();

  Future<void> signIn(String email, String password) async{
    await krepo.signIn(email, password);
  }

}