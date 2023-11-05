import 'package:dart_dersleri/collections/urunler.dart';

void main() {
  var u1 = Urunler(id: 1, ad: "Bilgisayar", fiyat: 34000);
  var u2 = Urunler(id: 2, ad: "TV", fiyat: 18000);
  var u3 = Urunler(id: 3, ad: "Saat", fiyat: 26000);

  var urunlerListesi = <Urunler>[];

  urunlerListesi.add(u1);
  urunlerListesi.add(u2);
  urunlerListesi.add(u3);

  for(var urun in urunlerListesi){
    print("ID : ${urun.id} - Adı : ${urun.ad} - Fiyat : ${urun.fiyat} ₺");
  }

  print("------------ Fiyat : Artan ---------------");

  Comparator<Urunler> siralama1 = (x,y) => x.fiyat.compareTo(y.fiyat);
  urunlerListesi.sort(siralama1);

  for(var urun in urunlerListesi){
    print("ID : ${urun.id} - Adı : ${urun.ad} - Fiyat : ${urun.fiyat} ₺");
  }

  print("------------ Fiyat : Azalan ---------------");

  Comparator<Urunler> siralama2 = (x,y) => y.fiyat.compareTo(x.fiyat);
  urunlerListesi.sort(siralama2);

  for(var urun in urunlerListesi){
    print("ID : ${urun.id} - Adı : ${urun.ad} - Fiyat : ${urun.fiyat} ₺");
  }

  print("------------ Ad : Artan ---------------");

  Comparator<Urunler> siralama3 = (x,y) => x.ad.compareTo(y.ad);
  urunlerListesi.sort(siralama3);

  for(var urun in urunlerListesi){
    print("ID : ${urun.id} - Adı : ${urun.ad} - Fiyat : ${urun.fiyat} ₺");
  }

  print("------------ Ad : Azalan ---------------");

  Comparator<Urunler> siralama4 = (x,y) => y.ad.compareTo(x.ad);
  urunlerListesi.sort(siralama4);

  for(var urun in urunlerListesi){
    print("ID : ${urun.id} - Adı : ${urun.ad} - Fiyat : ${urun.fiyat} ₺");
  }

  print("------------ Filtreleme 1 ---------------");

  Iterable<Urunler> filtreleme1 = urunlerListesi.where((element){
    return element.fiyat > 25000 && element.fiyat < 30000;
  });

  var liste1 = filtreleme1.toList();

  for(var urun in liste1){
    print("ID : ${urun.id} - Adı : ${urun.ad} - Fiyat : ${urun.fiyat} ₺");
  }

  print("------------ Filtreleme 2 ---------------");

  Iterable<Urunler> filtreleme2 = urunlerListesi.where((element){
    return element.ad.contains("a");
  });

  var liste2 = filtreleme2.toList();

  for(var urun in liste2){
    print("ID : ${urun.id} - Adı : ${urun.ad} - Fiyat : ${urun.fiyat} ₺");
  }


}