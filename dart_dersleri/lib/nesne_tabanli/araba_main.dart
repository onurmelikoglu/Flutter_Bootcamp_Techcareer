import 'package:dart_dersleri/nesne_tabanli/araba.dart';

void main(){

  // Nesne Oluşturma
  var bmw = Araba(renk:"Mavi", hiz:100, calisiyorMu:true);
  // Değer okuma
  bmw.bilgiAl();

  // Değer atama
  bmw.hiz = 70;

  bmw.bilgiAl();

  bmw.durdur();

  bmw.bilgiAl();

  bmw.hizlan(50);
  bmw.bilgiAl();
  bmw.yavasla(5);
  bmw.bilgiAl();

  var sahin = Araba(renk:"Beyaz", hiz:0, calisiyorMu:true);
  sahin.bilgiAl();

}