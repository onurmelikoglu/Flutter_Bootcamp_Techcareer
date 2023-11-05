import 'package:dart_dersleri/nesne_tabanli/kalitim_kullanimi/ev.dart';
import 'package:dart_dersleri/nesne_tabanli/kalitim_kullanimi/saray.dart';
import 'package:dart_dersleri/nesne_tabanli/kalitim_kullanimi/villa.dart';

void main(){
  var topkapiSarayi = Saray(kuleSayisi: 10, pencereSayisi: 200);

  print(topkapiSarayi.kuleSayisi);
  print(topkapiSarayi.pencereSayisi);

  var bogazVilla = Villa(garajVarMi: true, pencereSayisi: 40);
  print(bogazVilla.garajVarMi);
  print(bogazVilla.pencereSayisi);

  // Type Control
  if(topkapiSarayi is Saray){ // Java - instanceof
    print("Saraydır");
  }else{
    print("Saray değildir");
  }

  // Upcasting
  // Subclass > Superclass
  var saray = Saray(kuleSayisi: 3, pencereSayisi: 80);
  Ev ev = saray;

  // Downcasting
  // Superclass > subclass
  var e = Ev(pencereSayisi: 14);
  Saray s  = e as Saray;




}