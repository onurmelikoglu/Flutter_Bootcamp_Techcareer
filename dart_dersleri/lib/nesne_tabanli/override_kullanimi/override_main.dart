import 'package:dart_dersleri/nesne_tabanli/override_kullanimi/hayvan.dart';
import 'package:dart_dersleri/nesne_tabanli/override_kullanimi/kedi.dart';
import 'package:dart_dersleri/nesne_tabanli/override_kullanimi/kopek.dart';
import 'package:dart_dersleri/nesne_tabanli/override_kullanimi/memeli.dart';

void main(){
  var hayvan = Hayvan();
  var memeli = Memeli();
  var kedi = Kedi();
  var kopek = Kopek();

  hayvan.sesCikar(); // kalıtım yok, kendi metoduna erişiyor
  memeli.sesCikar(); // kalıtım var, üst sınıf metoduna erişiyor
  kedi.sesCikar(); // kalıtım var , kendi methoduna erişiyor
  kopek.sesCikar(); // kalıtım var , kendi methoduna erişiyor
}