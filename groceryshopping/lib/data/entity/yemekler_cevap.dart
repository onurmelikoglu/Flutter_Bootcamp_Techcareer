import 'package:groceryshopping/data/entity/yemekler.dart';

class YemeklerCevap{
  List<Yemekler> yemekler;
  int success;

  YemeklerCevap({required this.yemekler,required this.success});

  factory YemeklerCevap.fromJson(Map<String,dynamic> json){
    int success = json["success"] as int;
    var jsonArray = json["yemekler"] as List;
    List<Yemekler> yemekler = jsonArray.map((val) => Yemekler.fromJson(val)).toList();

    return YemeklerCevap(yemekler: yemekler, success: success);
  }

}