import 'package:dart_dersleri/nesne_tabanli/fonksiyonlar.dart';

void main(){
  var f = Fonksiyonlar();
  f.selamla();
  String gelenSonuc = f.selamla1();
  print("Gelen Sonuc : $gelenSonuc");
  f.selamla2("Onur");
  int gelenToplam = f.toplama(10,20);
  print("Gelen Toplam : $gelenToplam");
}