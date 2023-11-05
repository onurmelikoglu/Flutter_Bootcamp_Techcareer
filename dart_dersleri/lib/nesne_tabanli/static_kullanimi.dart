import 'package:dart_dersleri/nesne_tabanli/a_sinifi.dart';

void main(){
  var a = ASinifi();

  // Standart kullanım
  // print(a.degisken);
  // a.method();

  // Sanal veya isimsiz nesne
  // print(ASinifi().degisken);
  // ASinifi().method();

  // Static kullanımı - Kotlin : ( Companion Object)
  print(ASinifi.degisken);
  ASinifi.method();

}