import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryshopping/data/repo/kullanicilar_dao_repository.dart';

class SignUpPageCubit extends Cubit<void> {
  SignUpPageCubit():super(0);

  var krepo = KullanicilarDaoRepository();

  Future<void> signUp(String username, String email, String password) async{
    await krepo.signUp(username, email, password);
  }

}