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
  String username = "";
  String useremail = "";
  bool isUserLogedIn = false;
  bool isLoading = true;

  Future<void> getCurrentUser() async {
    try {
      Kullanicilar? currentUser = await krepo.getCurrentUser();
      if (currentUser != null) {
        setState(() {
          username = currentUser.username;
          useremail = currentUser.email;
          isUserLogedIn = true;
          isLoading = false;
        });
      } else {
        print("User not found or an error occurred.");
        setState(() { isLoading = false; });
      }
    } catch (e) {
      print("Error: $e");
    }
    setState(() { isLoading = false; });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    var screenWidth = screenInfo.size.width;
    var screenHeight = screenInfo.size.height;
    return Scaffold(
      appBar: AppBar(title: smallText(text: "Profil", fontsize: 24, color: mediumColor, fontweight: FontWeight.w600,), centerTitle: true,),
      body: isLoading ? const Center(child: CircularProgressIndicator()) :
      isUserLogedIn ?
      Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: const AssetImage("assets/images/profile.png"),
              backgroundColor: lightColor,
              radius: 30,
            ),
            title: smallText(text: username, fontsize: 18, color: mediumColor, fontweight: FontWeight.w600,),
            subtitle: smallText(text: useremail, fontsize: 16, color: lightColor),
            onTap: () {},
          ),
          const Divider(),
          SizedBox(
            width: screenWidth,
            height: screenHeight/1.48,
            child: Center(
              child: ElevatedButton(
                  onPressed: (){
                    context.read<UserProfileCubit>().signOut().then((value){
                      Navigator.pushReplacement(context,MaterialPageRoute(
                          builder: (context) => BottomNavigation(tabIndex: 2)));
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18), // <-- Radius
                      )
                  ),
                  child: smallText(text: "Çıkış Yap", fontsize: 16, color: Colors.white)
              ),
            ),
          )
        ],
      ) :
      Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginPage()),// Remove all routes from the stack
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18), // <-- Radius
                )
            ),
            child: smallText(text: "Giriş Yap", fontsize: 16, color: Colors.white)
        ),
      )
      ,
    );
  }
}
