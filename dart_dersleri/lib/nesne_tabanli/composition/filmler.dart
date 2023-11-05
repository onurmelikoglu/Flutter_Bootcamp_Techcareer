import 'package:dart_dersleri/nesne_tabanli/composition/kategoriler.dart';
import 'package:dart_dersleri/nesne_tabanli/composition/yonetmenler.dart';

class Filmler {
  int film_id;
  String film_ad;
  int film_yil;
  Kategoriler kategori; // Compositon : Kategoriler sınıfına erişim
  Yonetmenler yonetmen; // Composition : Yonetmenler sınıfına erişim

  Filmler({
    required this.film_id,
    required this.film_ad,
    required this.film_yil,
    required this.kategori,
    required this.yonetmen
  });
}