import 'package:dart_dersleri/nesne_tabanli/kalitim_kullanimi/ev.dart';

class Saray extends Ev {
  int kuleSayisi;

  Saray({required this.kuleSayisi, required int pencereSayisi}) : super(pencereSayisi: pencereSayisi);
  // super : üst sınıfı temsil eder
  // this : bulunduğu sınıfı temsil eder
}