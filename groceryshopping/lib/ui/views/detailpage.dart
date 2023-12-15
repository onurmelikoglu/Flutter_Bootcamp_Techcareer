import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryshopping/data/entity/kullanicilar.dart';
import 'package:groceryshopping/data/entity/yemekler.dart';
import 'package:groceryshopping/data/repo/kullanicilar_dao_repository.dart';
import 'package:groceryshopping/ui/cubit/bottomnavigation_cubit.dart';
import 'package:groceryshopping/ui/cubit/detailpage_cubit.dart';
import 'package:groceryshopping/ui/views/bottom_navigation.dart';
import 'package:groceryshopping/ui/views/loginpage.dart';
import 'package:groceryshopping/ui/widgets/customButton.dart';
import 'package:groceryshopping/ui/widgets/smallText.dart';
import 'package:groceryshopping/utils/colors.dart';

class DetailPage extends StatefulWidget {

  Yemekler yemek;
  DetailPage({required this.yemek});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  var tcItemQuantity = TextEditingController();
  var krepo = KullanicilarDaoRepository();
  String currentUserName = "";

  Future<void> getCurrentUser() async{
    Kullanicilar? currentUser = await krepo.getCurrentUser();
    if(currentUser != null){
      currentUserName = currentUser.username;
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    tcItemQuantity.text = "1";
  }

  @override
  Widget build(BuildContext context) {

    var screenInfo = MediaQuery.of(context);
    var screenWidth = screenInfo.size.width;
    var yemek = widget.yemek;
    
    return Scaffold(
      resizeToAvoidBottomInset: false, // klavye açıldığında butonun yukarı çıkmasını engeller
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenWidth,
          child: Column(
            children: [
              Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}"),
              SizedBox(
                width: screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: smallText(text: yemek.yemek_adi, fontsize: 24, color: mediumColor, fontweight: FontWeight.w600),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: (){
                                setState(() {
                                  if(tcItemQuantity.text != "1"){
                                    tcItemQuantity.text = (int.parse(tcItemQuantity.text)-1).toString();
                                  }
                                });
                              },
                              icon: Icon(Icons.remove, size: 32, color: tcItemQuantity.text == "1" ? lightColor:primaryColor,)
                          ),
                          const SizedBox(width: 5),
                          SizedBox(
                            width: 45,
                            height: 45,
                            child: TextField(
                              onChanged: (value){
                                if(value.isEmpty || int.parse(value) < 1 ){
                                  setState(() { // yanlışlıkla input silinmesini engeller
                                    tcItemQuantity.text = "1";
                                  });
                                }
                                // print("Değer: $value");
                              },
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(2),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: lightColor),
                                      borderRadius: BorderRadius.circular(16)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: lightColor),
                                      borderRadius: BorderRadius.circular(16)
                                  )
                              ),
                              controller: tcItemQuantity,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: 5),
                          IconButton(onPressed: (){
                            setState(() {
                              tcItemQuantity.text = (int.parse(tcItemQuantity.text)+1).toString();
                            });
                          }, icon: Icon(Icons.add, size: 32, color: primaryColor,)),
                          const Spacer(),
                          smallText(text: "${int.parse(yemek.yemek_fiyat)*int.parse(tcItemQuantity.text)} ₺", fontsize: 24, color: mediumColor, fontweight: FontWeight.w600,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // const Spacer(),

            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: customButton(
          text: "Sepete Ekle",
          onPressed: (){
            if(currentUserName != ""){
              // print("user: $currentUserName");
              var yemekSiparisAdeti = int.parse(tcItemQuantity.text);
              context.read<DetailPageCubit>().sepetEkle(yemek, yemekSiparisAdeti, currentUserName ).then((value){
                context.read<BottomNavigationCubit>().sepetToplamAdetAl();
                Navigator.of(context).popUntil((route) => route.isFirst);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: primaryColor,
                    content: smallText(text: "$yemekSiparisAdeti adet ${yemek.yemek_adi} Sepete eklendi!", fontsize: 16, color: Colors.white),
                    duration: const Duration(seconds: 3),
                  ),
                );
              });
              // Navigator.of(context).popUntil((route) => route.isFirst);
              // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => BottomNavigation(tabIndex: 1,)), (Route<dynamic> route) => false);

            }else{
              // print("userx: $currentUserName");
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
            }
          },
        ),
      )
    );
  }
}



