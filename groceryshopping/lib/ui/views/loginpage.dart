import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryshopping/data/entity/kullanicilar.dart';
import 'package:groceryshopping/data/repo/kullanicilar_dao_repository.dart';
import 'package:groceryshopping/ui/cubit/loginpage_cubit.dart';
import 'package:groceryshopping/ui/views/bottom_navigation.dart';
import 'package:groceryshopping/ui/views/signuppage.dart';
import 'package:groceryshopping/ui/widgets/customButton.dart';
import 'package:groceryshopping/ui/widgets/smallText.dart';
import 'package:groceryshopping/utils/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var tcEmail = TextEditingController();
  var tcPassword = TextEditingController();
  var krepo = KullanicilarDaoRepository();
  bool isPasswordVisible = false;
  bool isLoginSuccessed = false;

  Future<void> checkIsLoginSuccessed()async{
    Kullanicilar? currentUser = await krepo.getCurrentUser();
    if(currentUser != null){ isLoginSuccessed = true; }
    else{ isLoginSuccessed =  false;}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            smallText(text: "Giriş Yap", fontsize: 24, color: mediumColor, fontweight: FontWeight.w600,),
            TextField(
              controller: tcEmail,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: tcPassword,
              decoration: InputDecoration(
                  labelText: "Şifre",
                suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: lightColor,
                    ),
                    onPressed: () {
                      setState(() { isPasswordVisible = !isPasswordVisible; });
                    },
                ),
              ),
              obscureText: !isPasswordVisible,

            ),
            customButton(text: "Giriş Yap", onPressed: (){
              context.read<LoginPageCubit>().signIn(tcEmail.text, tcPassword.text).then((value){
                checkIsLoginSuccessed().then((value){
                  if(isLoginSuccessed){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (context) => BottomNavigation(tabIndex: 1)), (route) => false);
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: primaryColor,
                        content: smallText(text: "Kullanıcı giriş bilgileri hatalı. Lütfen tekrar deneyiniz!", fontsize: 16, color: Colors.white),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                });
              });

            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                smallText(text: "Hesabınız yok mu?", fontsize: 14, color: mediumColor, fontweight: FontWeight.w600,),
                TextButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => const SignUpPage()));
                    },
                    child: smallText(text: "Kayıt Ol", fontsize: 14, color: primaryColor, fontweight: FontWeight.w600),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
