void main(){
  // Tanımlama
  var plakalar = [16,23,6];
  var meyveler = <String>[];
  // Veri ekleme
  meyveler.add("Muz"); // index 0
  meyveler.add("Kiraz"); // index 1
  meyveler.add("Elma"); // index 2
  print(meyveler);

  // Güncelleme
  meyveler[1] = "Yeni Kiraz";
  print(meyveler);

  // İnsert
  meyveler.insert(1, "Portakal");
  print(meyveler);

  // Veri Okuma
  String meyve = meyveler[3];
  print("Meyve: $meyve");

  for(var m in meyveler){
    print("Sonuc : $m");
  }

  // 0,1,2,3
  for(var i=0; i<meyveler.length; i++){
    print("$i. --> ${meyveler[i]}");
  }

  print("Boş Kontrol: ${meyveler.isEmpty}");
  print("İçeriyor mu? : ${meyveler.contains("Muz")}");

  var liste = meyveler.reversed.toList();
  print("Reversed hali : $liste");

  meyveler.sort();
  print("Harf sırasına göre : $meyveler");

  meyveler.removeAt(1);
  print("Meyveler : $meyveler");

  meyveler.clear();
  print("Meyveler Temizleme : $meyveler");




}