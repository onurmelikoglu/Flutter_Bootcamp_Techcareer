void main(){
  var ogrenciAdi = "Ahmet";
  var ogrenciYas = 23;
  var ogrenciBoyu = 1.78;
  var ogrenciBasHarf = "A";
  var ogrenciDevamEdiyorMu = true;

  print(ogrenciAdi);
  print(ogrenciYas);
  print(ogrenciBoyu);
  print(ogrenciBasHarf);
  print(ogrenciDevamEdiyorMu);

  int urun_id = 3416;
  String urun_adi = "Kol Saati";
  int urun_adet = 100;
  double urun_fiyat = 149.99;
  String urun_tedarikci = "Rolex";

  print("Ürün id: $urun_id");
  print("Ürün adı: $urun_adi");
  print("Ürün adedi: $urun_adet");
  print("Ürün fiyatı: $urun_fiyat \$");
  print("Ürün fiyatı: $urun_tedarikci");

  int a = 10;
  int b = 20;

  print("$a x $b = ${a*b}");

  // Sabitler
  // final, const
  // Java(final), Swift(let), Kotlin(val)

  int sayi = 60;
  print(sayi);
  sayi = 140;
  print(sayi);

  // Değişkenlerde ve nesne tabanlı yapılarda kullanılır
  // Kodlamayı çalıştırdığımızda hafızada oluşur
  final int numara = 70;
  print(numara);
  // numara = 50;

  const double x = 70.7;
  // Görsel nesnelerde kullanılır
  // Bu değişkeni tanımlarken hafızada oluşur

  // Tür Dönüşümü - Type - casting
  // 1. Sayısaldan Sayısala Dönüşüm

  int i = 78;
  double d = 43.85;

  int sonuc1 = d.toInt();
  double sonuc2 = i.toDouble();
  print("Sonuc1: $sonuc1");
  print("Sonuc2: $sonuc2");

  // 2. Sayısaldan Metine Dönüşüm

  String sonuc3 = i.toString();
  print("Sonuc3: $sonuc3");
  String sonuc4 = d.toString();
  print("Sonuc4: $sonuc4");

  // 3. Metinden Sayısala Dönüşüm

  String yazi1 = "67";
  String yazi2 = "38.25";

  int sonuc5 = int.parse(yazi1);
  print("Sonuc5: $sonuc5");
  double sonuc6 = double.parse(yazi2);
  print("Sonuc6: $sonuc6");














}