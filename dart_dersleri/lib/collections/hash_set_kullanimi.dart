import 'dart:collection';

void main(){
  // Tanımlama
  var plakalar = HashSet.from([16,23,6]); // Listeyi hashset e çeviriyor
  var meyveler = HashSet<String>();

  // Değer atama Veri ekleme
  meyveler.add("Elma");
  meyveler.add("Muz");
  meyveler.add("Kiraz");

  print(meyveler);

  // meyveler.add("Elma");  // Elma olduğu için eklemiyor
  meyveler.add("Amasya Elması");

  print(meyveler);

  String meyve = meyveler.elementAt(2);

  print("Meyve : $meyve");

  for(var meyve in meyveler){
    print("Sonuc : $meyve");
  }

  for(var i = 0; i < meyveler.length; i++){
    print("$i. -> ${meyveler.elementAt(i)}");
  }

  meyveler.remove("Muz"); // Veri silme
  print(meyveler);

  meyveler.clear(); // Array temizleme
  print(meyveler);

}