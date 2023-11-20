import 'package:flutter/material.dart';
import 'package:trendyol_page_clone/data/entity/kategoriler.dart';
import 'package:trendyol_page_clone/data/entity/urunler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PopulerUrunlerSayfa extends StatefulWidget {
  const PopulerUrunlerSayfa({super.key});

  @override
  State<PopulerUrunlerSayfa> createState() => _PopulerUrunlerSayfaState();
}

class _PopulerUrunlerSayfaState extends State<PopulerUrunlerSayfa> {

  int? seciliKategori = 0;
  int secilenSayfaIndex = 0;

  Future<List<Kategoriler>> kategorileriYukle() async{
    var kategorilerListesi = <Kategoriler>[];
    var k1 = Kategoriler(id: 1, name: "Outdoor Ayakkabı");
    var k2 = Kategoriler(id: 2, name: "Boot & Bootie");
    var k3 = Kategoriler(id: 3, name: "Sweatshirt");
    var k4 = Kategoriler(id: 4, name: "Saat");
    var k5 = Kategoriler(id: 5, name: "OEM");
    var k6 = Kategoriler(id: 6, name: "Polar");
    var k7 = Kategoriler(id: 7, name: "Parfüms");

    kategorilerListesi.add(k1);
    kategorilerListesi.add(k2);
    kategorilerListesi.add(k3);
    kategorilerListesi.add(k4);
    kategorilerListesi.add(k5);
    kategorilerListesi.add(k6);
    kategorilerListesi.add(k7);

    return kategorilerListesi;
  }
  
  Future<List<Urunler>> urunleriYukle() async{
    //urunlerListesi = <Urunler>[];
    var urunlerListesi = <Urunler>[];

    var kategorilerListesi = await kategorileriYukle();
    var k1 = kategorilerListesi.where((k) => k.id == 1);
    var k2 = kategorilerListesi.where((k) => k.id == 2);
    var k3 = kategorilerListesi.where((k) => k.id == 3);
    var k4 = kategorilerListesi.where((k) => k.id == 4);
    var k5 = kategorilerListesi.where((k) => k.id == 5);
    var k6 = kategorilerListesi.where((k) => k.id == 6);
    var k7 = kategorilerListesi.where((k) => k.id == 7);

    var u1 = Urunler(id: 1, brandName: "Muggo", image: "mungo_north_unisex.png", name: "North Unisex Garantili Kışlık Trekking Outdoor Sneaker Ayakkabı", banner: "en_cok_satan.png", rating: 4.5, evaluation: 1660, price: 579.90, coupon: "Kupon Fırsatı", buyMorePayLess: "", fastDelivery: true, freeCargo: true, kategori: k1.first);
    var u2 = Urunler(id: 2, brandName: "westkombin", image: "westkombin_sweat_brooklyn.png", name: "Lacivert Sweat Brooklyn Baskılı Oversize", banner: "iyi_fiyat.png", rating: 4, evaluation: 3225, price: 137.49, coupon: "", buyMorePayLess: "Çok Al Az Öde", fastDelivery: false, freeCargo: false, kategori: k3.first);
    var u3 = Urunler(id: 3, brandName: "XStep", image:"xstep_kislik_bot.png", name: "Tunnel Soğuğa Dayanıklı Kışlık Trekking Ayakkabı Bot", banner: "", rating: 4.5, evaluation: 1195, price: 516, coupon: "30 TL Kupon", buyMorePayLess: "Çok Al Az Öde", fastDelivery: true, freeCargo: true, kategori: k2.first);
    var u4 = Urunler(id: 4, brandName: "ORLONTEX", image: "orlontex_nasa_sweatshirt.png", name: "Erkek Beyaz Nasa Baskılı Kapüşonlu Sweatshirt", banner: "avantajli.png", rating: 3.5, evaluation: 3, price: 319.90, coupon: "", buyMorePayLess: "", fastDelivery: false, freeCargo: true, kategori: k3.first);
    var u5 = Urunler(id: 5, brandName: "Black Sokak", image: "black_sokak_aloha.png", name: "Lacivert Aloha Baskılı Oversize Kapüşonlu Erkek Sweatshirt", banner: "cok_avantajli.png", rating: 3, evaluation: 138, price: 269.90, coupon: "", buyMorePayLess: "Çok Al Az Öde", fastDelivery: true, freeCargo: true, kategori: k3.first);
    var u6 = Urunler(id: 6, brandName: "Avon", image: "avon_perceive.png", name: "Perceive Erkek EDT - 100ml", banner: "", rating: 4.5, evaluation: 16946, price: 260, coupon: "", buyMorePayLess: "", fastDelivery: true, freeCargo: true, kategori: k7.first);
    var u7 = Urunler(id: 7, brandName: "GENIUS", image: "genius_polar.png", name: "Store Erkek Polar Tam Fermuarlı 3 Cepli Outdoor Polar Ceket Tactical Flecee POLAR-GNS", banner: "", rating: 4.5, evaluation: 10869, price: 379.90, coupon: "", buyMorePayLess: "2 Adede %2", fastDelivery: true, freeCargo: true, kategori: k6.first);
    var u8 = Urunler(id: 8, brandName: "Casio", image: "casio_saat.png", name: "Erkek Kol Saati MTP-V001d-1BUDF", banner: "", rating: 5, evaluation: 3893, price: 1135.64, coupon: "", buyMorePayLess: "", fastDelivery: false, freeCargo: false, kategori: k4.first);
    var u9 = Urunler(id: 9, brandName: "ASUS", image: "asus_tuf_gtx1660.png", name: "TUF GTX1660S-6G-GAMING 192 Bit GDDR6 6 GB Ekran Kartı TUF-GTX1660S-6G-GAMING", banner: "super_avantajli.png", rating: 5, evaluation: 9, price: 6799.90, coupon: "", buyMorePayLess: "", fastDelivery: true, freeCargo: true, kategori: k5.first);
    var u10 = Urunler(id: 10, brandName: "logitech", image: "logitech_klavye.png", name: "K270 Tam Boyutlu Kablosuz Türkçe Klavye - Siyah", banner: "super_avantajli.png", rating: 4.5, evaluation: 147, price: 595, coupon: "", buyMorePayLess: "", fastDelivery: true, freeCargo: true, kategori: k5.first);

    urunlerListesi.add(u1);
    urunlerListesi.add(u2);
    urunlerListesi.add(u3);
    urunlerListesi.add(u4);
    urunlerListesi.add(u5);
    urunlerListesi.add(u6);
    urunlerListesi.add(u7);
    urunlerListesi.add(u8);
    urunlerListesi.add(u9);
    urunlerListesi.add(u10);

    return urunlerListesi;
  }

  Future<List<Urunler>> urunFiltrele(int? kategori_id) async{
    var urunlerListesi = await urunleriYukle();

    var filtreliurunler =  urunlerListesi.where((i) =>
                          i.kategori.id == kategori_id).toList();

    if(filtreliurunler.isNotEmpty){
      return filtreliurunler;
    }else{
      return urunlerListesi;
    }

  }

  @override
  void initState() {
    super.initState();
    urunFiltrele(seciliKategori);
  }
  
  
  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    var screenHeight = screenInfo.size.height;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const Text("Senin İçin Seçtik"),
        leading: const Icon(Icons.arrow_back_rounded),
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: ListView(
          children: [
            FutureBuilder<List<Kategoriler>>(
              future: kategorileriYukle(),
              builder: (context, snapshot){
              if(snapshot.hasData){
                var kategoriListesi = snapshot.data;
                return SizedBox(
                  height: screenHeight * 10/100,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: kategoriListesi!.length,
                    itemBuilder: (context, index){
                      var kategori = kategoriListesi[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ChoiceChip(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.only(bottom: 0.1),
                          label: smallTxt(txt: kategori.name, fontsize: 12, fontweight: FontWeight.bold, color: seciliKategori == kategori.id ? Colors.orange : Colors.grey),
                          //labelStyle: TextStyle( color: seciliKategori == index ? Colors.orange : Colors.grey),
                          side: BorderSide(color: seciliKategori == kategori.id ? Colors.orange : Colors.grey.shade300),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          selected: seciliKategori == kategori.id,
                          showCheckmark: false,
                          selectedColor: Colors.white,
                          onSelected: (bool selected) {
                            setState(() {
                              seciliKategori = selected ? kategori.id : null;
                              urunFiltrele(kategori.id);
                            });
                          },
                        ),
                      );;
                    },
                  ),
                );
              }else{
                return const Center();
              }
            },
          ),
            FutureBuilder<List<Urunler>>(
              future: urunFiltrele(seciliKategori),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  var urunlerListesi = snapshot.data;
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: urunlerListesi!.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 2.22,
                    ),
                    itemBuilder: (context,index){
                      var urun = urunlerListesi[index];
                      return Card(
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Image.asset("images/${urun.image}"),
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                                  child: Image.asset("images/${urun.image}"),
                                ),
                                Positioned(
                                  left: 5,
                                  top: 5,
                                  child: Visibility(
                                      visible: urun.banner != "",
                                      child: Image.asset("images/${urun.banner}", height: 50, width: 50,)),
                                ),
                                Positioned(
                                    top:5,
                                    right:5,
                                    child: Card(
                                      color: Colors.white,
                                      surfaceTintColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50.0),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Icon(Icons.favorite_outline, size: 20,),
                                      ),
                                    )
                                )
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: SizedBox(
                                height: screenHeight * (20/100),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(text: "${urun.brandName} ",style: const TextStyle(fontSize:12,fontFamily: "SourceSans",fontWeight: FontWeight.bold),),
                                          TextSpan( text: urun.name,style: TextStyle(fontSize:12, color: Colors.grey.shade600, fontFamily: "SourceSans",) )
                                        ],
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 2,),
                                    Row(
                                      children: [
                                        RatingBar.builder(
                                          initialRating: urun.rating,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: const EdgeInsets.only(left: 1, right: 1),
                                          itemSize: 16,
                                          itemBuilder: (context, index) => const Icon( Icons.star, color: Colors.amber,size: 10,),
                                          onRatingUpdate: (rating) {
                                            // print(rating);
                                          },
                                        ),
                                        smallTxt(txt: " (${urun.evaluation})", fontsize: 12, color: Colors.grey.shade700)
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    smallTxt(txt: "${urun.price} TL", fontsize: 12, color: Colors.orangeAccent, fontweight: FontWeight.bold, ),
                                    const SizedBox(height: 5,),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Visibility(visible: urun.coupon != "", child: bottomBanners(backgroundColor: Color(0xfffff0f4), icon: Icons.price_change_rounded, iconColor: Colors.pink, content: urun.coupon)),
                                        Visibility(visible: urun.buyMorePayLess != "", child: bottomBanners(backgroundColor: Color(0xfffff6ee), icon: Icons.discount_rounded, iconColor: Colors.orange, content: urun.buyMorePayLess)),
                                        Visibility(visible: urun.fastDelivery, child: bottomBanners(backgroundColor: Color(0xffebfaf3), icon: Icons.local_shipping, iconColor: Colors.green, content: "Hızlı Teslimat")),
                                        Visibility(visible: urun.freeCargo, child: bottomBanners(backgroundColor: Color(0xfff7f7f7), icon: Icons.square_rounded, iconColor: Colors.grey, content: "Kargo Bedava")),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),


                          ],
                        ),
                      );
                    },
                  );
                }else{
                  return const Center();
                }
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa"),
          BottomNavigationBarItem(icon: Badge(label: Text("3"), child: Icon(Icons.fastfood_rounded),),label: "Trendyol Go"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorilerim"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Sepetim"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Hesabım"),
        ],
        currentIndex: secilenSayfaIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        showUnselectedLabels: true,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        unselectedItemColor: Colors.grey,
        onTap: (index){
          setState(() {
            secilenSayfaIndex = index;
          });
        },
      ),
    );
  }
}

class smallTxt extends StatelessWidget {

  String txt;
  double fontsize;
  Color color;
  FontWeight fontweight;
  TextAlign textalign;
  double height;


  smallTxt({
      required this.txt,
      required this.fontsize,
      required this.color,
      this.fontweight = FontWeight.normal,
      this.textalign = TextAlign.start,
      this.height = 1.2
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        txt,
        textAlign: textalign,
        style: TextStyle(fontSize: fontsize, color: color, fontFamily: "SourceSans", fontWeight: fontweight, height: height)
    );
  }
}


class bottomBanners extends StatelessWidget {
  
  Color backgroundColor;
  IconData icon;
  Color iconColor;
  String content;

  bottomBanners({
    required this.backgroundColor,
    required this.icon,
    required this.iconColor,
    required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2,right: 2),
      child: Container(
        width: 40,
        height: 55,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(6.0)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: iconColor,),
              const SizedBox(height: 4,),
              Text(
                  content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 8, fontFamily: "SourceSans", fontWeight: FontWeight.bold, height: 1.2)
              )
            ],
          ),
        ),
      ),
    );
  }
}


