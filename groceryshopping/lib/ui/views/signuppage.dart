import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryshopping/ui/cubit/signuppage_cubit.dart';
import 'package:groceryshopping/ui/views/loginpage.dart';
import 'package:groceryshopping/ui/widgets/customButton.dart';
import 'package:groceryshopping/ui/widgets/smallText.dart';
import 'package:groceryshopping/utils/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  var tcUsername = TextEditingController();
  var tcEmail = TextEditingController();
  var tcPassword = TextEditingController();
  bool isPasswordVisible = false;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    tcUsername.dispose();
    tcEmail.dispose();
    tcPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    var screenWidth = screenInfo.size.width;
    var screenHeight = screenInfo.size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: SingleChildScrollView(
          child: SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  smallText(text: "Kayıt Ol", fontsize: 24, color: mediumColor, fontweight: FontWeight.w600,),
                  TextFormField(
                    controller: tcUsername,
                    decoration: const InputDecoration(labelText: "Kullanıcı Adı"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Lütfen Boş Alan Bırakmayınız';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: tcEmail,
                    decoration: const InputDecoration(labelText: "Email"),
                    validator: (value) {
                      if (value!.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)) {
                        return 'Lütfen Email Giriniz';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
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
                        )
                    ),
                    obscureText: !isPasswordVisible,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Lütfen Boş Alan Bırakmayınız';
                      }
                      if(value.length < 5){
                        return 'En az 5 karakter uzunluğunda bir şifre giriniz';
                      }
                      return null;
                    },

                  ),
                  customButton(
                    text: "Kayıt Ol",
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        context.read<SignUpPageCubit>().signUp(tcUsername.text, tcEmail.text, tcPassword.text).then((value){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: primaryColor,
                              content: smallText(text: "Kayıt Başarılı! Giriş yapabilirsiniz.", fontsize: 16, color: Colors.white),
                              duration: const Duration(seconds: 3),
                            ),
                          );
                          isLoading = false;
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                        });

                      }

                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      smallText(text: "Hesabınız var mı?", fontsize: 14, color: mediumColor, fontweight: FontWeight.w600,),
                      TextButton(
                          onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                          },
                          child: smallText(text: "Giriş Yap", fontsize: 14, color: primaryColor, fontweight: FontWeight.w600,),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
