import 'dart:collection';

void main(){
  // Tanımlama
  var sayilar = {"Bir":1,"İki":2};
  var iller = HashMap<int,String>();

  // Değer ataması
  iller[16] = "BURSA";
  iller[34] = "İSTANBUL";
  print(iller);

  // GÜncelleme
  iller[16] = "Yeni Bursa";
  print(iller);

  // Veri Okuma
  String? il = iller[34];

  if(il != null){
    print("İl : $il");
  }

  // Boyutu
  print("Boyut : ${iller.length}");
  print("Boş kontrol : ${iller.isEmpty}");
  print("İçeriyor mu ? : ${iller.containsValue("İSTANBUL")}");

  var anahtar = iller.keys;

  for(var a in anahtar){
    print("$a -> ${iller[a]}");
  }

  iller.remove(16);
  print(iller);

  iller.clear();
  print(iller);




}