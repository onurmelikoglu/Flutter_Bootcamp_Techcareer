import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryshopping/data/entity/kullanicilar.dart';
import 'package:groceryshopping/data/repo/kullanicilar_dao_repository.dart';
import 'package:groceryshopping/ui/cubit/userprofile_cubit.dart';
import 'package:groceryshopping/ui/views/bottom_navigation.dart';
import 'package:groceryshopping/ui/views/loginpage.dart';
import 'package:groceryshopping/ui/widgets/smallText.dart';
import 'package:groceryshopping/utils/colors.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var krepo = KullanicilarDaoRepository();
  Kullanicilar? kullanici;
  bool isLoading = true;
  final formKey = GlobalKey<FormState>();
  final tcUsername = TextEditingController();
  final tcUserAddress = TextEditingController();

  Future<void> getCurrentUser() async {
    try {
      Kullanicilar? currentUser = await krepo.getCurrentUser();
      if (currentUser != null) {
        setState(() {
          kullanici = currentUser;
          tcUsername.text = kullanici!.username;
          tcUserAddress.text = kullanici!.address;
          isLoading = false;
        });
      } else {
        setState(() { isLoading = false; });
      }
    } catch (e) {
      // print("Error: $e");
    }
    setState(() { isLoading = false; });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    var screenWidth = screenInfo.size.width;
    var screenHeight = screenInfo.size.height;
    return Scaffold(
      appBar: AppBar(
        title: smallText(
          text: "Profil",
          fontsize: 24,
          color: mediumColor,
          fontweight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : kullanici != null
              ? SizedBox(
                  width: screenWidth,
                  height: screenHeight,
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              const AssetImage("assets/images/profile.png"),
                          backgroundColor: lightColor,
                          radius: 30,
                        ),
                        title: smallText(
                          text: kullanici!.username,
                          fontsize: 18,
                          color: mediumColor,
                          fontweight: FontWeight.w600,
                        ),
                        subtitle: smallText(
                            text: kullanici!.email, fontsize: 16, color: lightColor),
                        onTap: () {},
                      ),
                      const Divider(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: tcUsername,
                                        decoration: const InputDecoration(
                                            labelText: "Kullanıcı Adı"),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                          controller: tcUserAddress,
                                          decoration: const InputDecoration(
                                              labelText: "Adres")),
                                    ],
                                  )),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<UserProfileCubit>()
                                            .saveUserData(kullanici!.userid, tcUsername.text,
                                                tcUserAddress.text).then((value){
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      backgroundColor: primaryColor,
                                                      content: smallText(text: "Kayıt Güncellendi!", fontsize: 16, color: Colors.white),
                                                      duration: const Duration(seconds: 3),
                                                    ),
                                                  );
                                                });
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                18), // <-- Radius
                                          )),
                                      child: smallText(
                                          text: "Kaydet",
                                          fontsize: 16,
                                          color: Colors.white)),
                                  const signOutButton(),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LoginPage()), // Remove all routes from the stack
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(18), // <-- Radius
                          )),
                      child: smallText(
                          text: "Giriş Yap",
                          fontsize: 16,
                          color: Colors.white)),
                ),
    );
  }
}

class signOutButton extends StatelessWidget {
  const signOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            context.read<UserProfileCubit>().signOut().then((value) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BottomNavigation(tabIndex: 0)));
            });
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18), // <-- Radius
              )),
          child:
              smallText(text: "Çıkış Yap", fontsize: 16, color: Colors.white)),
    );
  }
}
