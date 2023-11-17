import 'package:trendyol_page_clone/data/entity/kategoriler.dart';

class Urunler {
  int id;
  String image;
  String brandName;
  String name;
  String banner;
  double rating;
  int evaluation;
  double price;
  String coupon;
  String buyMorePayLess;
  bool fastDelivery;
  bool freeCargo;
  Kategoriler kategori;

  Urunler({
    required this.id,
    required this.brandName,
    required this.image,
    required this.name,
    required this.banner,
    required this.rating,
    required this.evaluation,
    required this.price,
    required this.coupon,
    required this.buyMorePayLess,
    required this.fastDelivery,
    required this.freeCargo,
    required this.kategori
  });
}