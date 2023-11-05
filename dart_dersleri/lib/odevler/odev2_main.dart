import 'package:dart_dersleri/odevler/odev2.dart';

void main(){

  var odev2 = Odev2();

  print("------------SORU 1------------");
  int km = 10;
  var mile = odev2.mileConverter(km);
  print("$km kilometre $mile mil eder");

  print("------------SORU 2------------");
  int uzunKenar = 10;
  int kisaKenar = 5;
  odev2.areaCalculator(uzunKenar,kisaKenar);

  print("------------SORU 3------------");
  int sayi1 = 3;
  var faktorial = odev2.factorialCalculator(sayi1);
  print("$sayi1'in faktoriyeli $faktorial'dir");

  print("------------SORU 4------------");
  String word = "Elektrik";
  odev2.letterCounter(word);

  print("------------SORU 5------------");
  int kenarSayisi = 5;
  var icAcilarToplami = odev2.angleCalculator(kenarSayisi);
  print("İç Açılar Toplamı : $icAcilarToplami");

  print("------------SORU 6------------");
  int workDay = 19;
  var salary = odev2.salaryCalculator(workDay);
  print("$workDay gün için yapılacak ödeme tutarı : $salary ₺");

  print("------------SORU 7------------");
  int parkingHour = 3;
  var parkingPrice = odev2.parkingCalculator(parkingHour);
  print("Kalınan $parkingHour saat için toplam park ücreti : $parkingPrice ₺");

}