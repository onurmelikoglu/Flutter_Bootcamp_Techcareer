import 'package:flutter/material.dart';
import 'package:groceryshopping/ui/views/homepage.dart';
import 'package:groceryshopping/ui/views/shoppingcartpage.dart';
import 'package:groceryshopping/ui/views/userprofile.dart';
import 'package:groceryshopping/utils/colors.dart';

class BottomNavigation extends StatefulWidget {
  int tabIndex;
  BottomNavigation({this.tabIndex = 0});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int pageIndex = 0;
  var pages = [ const HomePage(), const ShoppingCartPage(), const UserProfile() ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageIndex = widget.tabIndex;
  }

  @override
  Widget build(BuildContext context) {
    // pageIndex = widget.tabIndex;
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30)
            ),
            boxShadow:[BoxShadow(color: lightColor, spreadRadius: 0, blurRadius: 4)],
          ),
          child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Anasayfa"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded), label: "Sepet"),
              BottomNavigationBarItem(icon: Icon(Icons.person_2), label: "Hesap"),
            ],
            currentIndex: pageIndex,
            backgroundColor: Colors.white,
            selectedItemColor: primaryColor,
            //unselectedItemColor: Colors.white38,
            onTap: (index){
              setState(() {
                pageIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
