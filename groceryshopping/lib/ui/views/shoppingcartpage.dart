import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryshopping/data/entity/kullanicilar.dart';
import 'package:groceryshopping/data/entity/sepet_yemekler.dart';
import 'package:groceryshopping/data/repo/kullanicilar_dao_repository.dart';
import 'package:groceryshopping/ui/cubit/bottomnavigation_cubit.dart';
import 'package:groceryshopping/ui/cubit/shoppingcartpage_cubit.dart';
import 'package:groceryshopping/ui/views/order_complete_screen.dart';
import 'package:groceryshopping/ui/widgets/customButton.dart';
import 'package:groceryshopping/ui/widgets/smallText.dart';
import 'package:groceryshopping/utils/colors.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {

  List<TextEditingController> tcItemQuantity = [];
  List<int> tumSepetYemekIdListesi = [];
  int totalPrice = 0;
  bool isLoading = true;
  bool isLoaded = false;

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
    // TODO: implement initState
    super.initState();
    getCurrentUser().then((value){
      context.read<ShoppingCartPageCubit>().sepetiYukle(currentUserName);
    });
    Future.delayed(const Duration(seconds: 1), () {
      if(mounted){
        setState(() { isLoading = false; });
      }
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    var screenWidth = screenInfo.size.width;
    // var screenHeight = screenInfo.size.height;
    return Scaffold(
        appBar: AppBar(title: smallText(text: "Sepet", fontsize: 24, color: mediumColor, fontweight: FontWeight.w600,), centerTitle: true,),
        body: isLoading ? const Center(child: CircularProgressIndicator()):
          BlocBuilder<ShoppingCartPageCubit,List<SepetYemekler>>(
          builder: (context, sepetYemekListesi){
            if(sepetYemekListesi.isNotEmpty){
              totalPrice = 0;
              tumSepetYemekIdListesi = [];
              isLoaded = true;
              return ListView.builder(
                  itemCount: sepetYemekListesi.length,
                  itemBuilder: (context, index){
                    var sepetyemek = sepetYemekListesi[index];
                    tcItemQuantity.add(TextEditingController());
                    tcItemQuantity[index].text = sepetyemek.yemek_siparis_adet.toString();
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        width: screenWidth,
                        height: 150,
                        child: Card(
                          surfaceTintColor: Colors.white,
                          elevation: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${sepetyemek.yemek_resim_adi}", width: 100,),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          smallText(text: sepetyemek.yemek_adi, fontsize: 18, color: mediumColor, fontweight: FontWeight.w600,),
                                          GestureDetector(
                                              onTap: (){
                                                showDialog<void>(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return AlertDialog(
                                                      surfaceTintColor: Colors.white,
                                                      title: const Row(
                                                        children: [
                                                          Icon(Icons.warning, color: Colors.red),
                                                          SizedBox(width: 10),
                                                          Text('Sil'),
                                                        ],
                                                      ),
                                                      content: const Text('Ürün sepetten silmek istediğine emin misin?'),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child: smallText(text: "Hayır", fontsize: 14, color: lightColor, fontweight: FontWeight.w600,),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            context.read<ShoppingCartPageCubit>().sepettenSil(currentUserName,int.parse(sepetyemek.sepet_yemek_id)).then((value){
                                                              context.read<BottomNavigationCubit>().sepetToplamAdetAl();
                                                              context.read<ShoppingCartPageCubit>().sepetiYukle(currentUserName);
                                                              Navigator.pop(context);
                                                            });
                                                          },
                                                          child: smallText(text: "Evet", fontsize: 14, color: Colors.red, fontweight: FontWeight.w600),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              child: Icon(Icons.cancel, color: lightColor,)
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              InkWell(
                                                  borderRadius: BorderRadius.circular(50),
                                                  child: Icon(Icons.remove,size: 28, color: tcItemQuantity[index].text == "1" ? lightColor:primaryColor,),
                                                  onTap: () {
                                                    int currentQuantity = int.parse(tcItemQuantity[index].text);
                                                    if(currentQuantity > 1){
                                                      context.read<ShoppingCartPageCubit>().sepetiGuncelle(currentUserName,sepetyemek,(currentQuantity-1)).then((value){
                                                        context.read<BottomNavigationCubit>().sepetToplamAdetAl();
                                                        context.read<ShoppingCartPageCubit>().sepetiYukle(currentUserName);
                                                      });
                                                      //  print(tcItemQuantity[index].text);
                                                    }
                                                  }
                                              ),
                                              const SizedBox(width: 5),
                                              SizedBox(
                                                width: 40,
                                                height: 40,
                                                child: TextField(
                                                  onChanged: (value){
                                                    if(value.isEmpty || int.parse(value) < 1){
                                                      setState(() { // yanlışlıkla input silinmesini engeller
                                                        tcItemQuantity[index].text = "1";
                                                      });
                                                    }else{
                                                      int newQuantity = int.parse(value);
                                                      context.read<ShoppingCartPageCubit>().sepetiGuncelle(currentUserName,sepetyemek,newQuantity).then((value){
                                                        context.read<BottomNavigationCubit>().sepetToplamAdetAl();
                                                        context.read<ShoppingCartPageCubit>().sepetiYukle(currentUserName);
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
                                                  controller: tcItemQuantity[index],
                                                  keyboardType: TextInputType.number,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              InkWell(
                                                borderRadius: BorderRadius.circular(50),
                                                onTap: (){
                                                  int currentQuantity = int.tryParse(tcItemQuantity[index].text) ?? 1;
                                                  context.read<ShoppingCartPageCubit>().sepetiGuncelle(currentUserName,sepetyemek,(currentQuantity+1)).then((value){
                                                    context.read<BottomNavigationCubit>().sepetToplamAdetAl();
                                                    context.read<ShoppingCartPageCubit>().sepetiYukle(currentUserName);
                                                  });
                                                  // print(tcItemQuantity[index].text);
                                                },
                                                child: Icon(Icons.add,size: 28, color: primaryColor,),
                                              ),
                                            ],
                                          ),
                                          // const Spacer(),
                                          smallText(text: "${int.parse(sepetyemek.yemek_fiyat)*int.parse(tcItemQuantity[index].text)} ₺", fontsize: 22, color: mediumColor, fontweight: FontWeight.w600,)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              );
            }else{
              return const emptyBasket();
            }
          },
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<ShoppingCartPageCubit,List<SepetYemekler>>(
        builder: (context, sepetYemekListesi) {
          if (sepetYemekListesi.isNotEmpty && isLoaded){
            totalPrice = 0;
            tumSepetYemekIdListesi = [];
            for(int i = 0; i< sepetYemekListesi.length; i++){
              totalPrice += int.parse(sepetYemekListesi[i].yemek_siparis_adet) * int.parse(sepetYemekListesi[i].yemek_fiyat);
              tumSepetYemekIdListesi.add(int.parse(sepetYemekListesi[i].sepet_yemek_id));
            }
            // print("tum yemekler: ${tumSepetYemekIdListesi.toString()}");
            return orderButton(currentUserName: currentUserName,tumSepetYemekIdListesi: tumSepetYemekIdListesi, totalPrice: totalPrice);
          } else {
            return Container(); // You can also return null
          }
        }
      ),
      // bottomNavigationBar: const Center(),
    );
  }
}

class emptyBasket extends StatelessWidget {
  const emptyBasket({super.key});

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    var screenWidth = screenInfo.size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("assets/images/empty_basket.png", width: 300,),
          Column(
            children: [
              smallText(text: "Sepetiniz Boş!", fontsize: 24, color: mediumColor, fontweight: FontWeight.w600,),
              const SizedBox(height: 10,),
              SizedBox(
                  width: screenWidth/1.7,
                  child: smallText(text: "Görünüşe göre  henüz bir seçim yapmadınız..", fontsize: 18, color: lightColor, maxlines: 2, textAlign: TextAlign.center,)
              )
            ],
          )

        ],
      ),
    );
  }
}


class orderButton extends StatelessWidget {

  List<int> tumSepetYemekIdListesi;
  int totalPrice;
  String currentUserName;

  orderButton({
    required this.currentUserName,
    required this.tumSepetYemekIdListesi,
    required this.totalPrice
  });

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    var screenWidth = screenInfo.size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: customButton(
          text: "Ödemeye Geç",
          onPressed: (){
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context){
                  return SizedBox(
                    width: screenWidth,
                    height: 400,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              smallText(text: "Sipariş Seçenekleri", fontsize: 22, color: mediumColor,fontweight: FontWeight.w600,),
                              IconButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.close, size: 28, color: mediumColor)
                              )
                            ],
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    smallText(text: "Teslimat Adresi", fontsize: 18, color: lightColor),
                                    smallText(text: "Evim", fontsize: 18, color: mediumColor, fontweight: FontWeight.w600,)
                                  ],
                                ),
                              ),
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    smallText(text: "Ödeme", fontsize: 18, color: lightColor),
                                    SizedBox(width: 40, child: Image.asset("assets/icons/mastercard.png"),)
                                  ],
                                ),
                              ),
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    smallText(text: "Toplam ücret", fontsize: 18, color: lightColor),
                                    smallText(text: "${totalPrice.toString()} ₺", fontsize: 18, color: mediumColor,fontweight: FontWeight.w600,)
                                  ],
                                ),
                              ),
                              const Divider(),
                              const SizedBox(height: 40,),
                              customButton(
                                text: "Sipariş Et",
                                onPressed: (){
                                  context.read<ShoppingCartPageCubit>().sepetiTamamla(currentUserName,tumSepetYemekIdListesi).then((value){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OrderCompleteScreen()));
                                  });
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }
            );
          },
      ),
    );

  }
}

