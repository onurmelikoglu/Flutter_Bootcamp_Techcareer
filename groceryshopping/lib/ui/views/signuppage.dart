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

  @override
  void dispose() {
    super.dispose();
    tcUsername.dispose();
    tcEmail.dispose();
    tcPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            smallText(text: "Kayıt Ol", fontsize: 24, color: mediumColor, fontweight: FontWeight.w600,),
            TextField(
              controller: tcUsername,
              decoration: const InputDecoration(labelText: "Kullanıcı Adı"),
            ),
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
                  )
              ),
              obscureText: !isPasswordVisible,
            ),
            ElevatedButton(onPressed: (){
              context.read<SignUpPageCubit>().signUp(tcUsername.text, tcEmail.text, tcPassword.text);
            }, child: const Text("Kayıt ol")),
            customButton(
              text: "Kayıt Ol",
              onPressed: (){
                context.read<SignUpPageCubit>().signUp(tcUsername.text, tcEmail.text, tcPassword.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: primaryColor,
                    content: smallText(text: "Kayıt Başarılı! Giriş yapabilirsiniz.", fontsize: 16, color: Colors.white),
                    duration: const Duration(seconds: 3),
                  ),
                );
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => const LoginPage()));
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
    );
  }
}
