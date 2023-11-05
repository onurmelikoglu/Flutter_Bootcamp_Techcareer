class Odev2{

  double mileConverter(int km){
    double mile = km * 0.621; // mil hesabı
    return mile;
  }

  void areaCalculator(int uzunKenar, int kisaKenar){
    var alan = uzunKenar * kisaKenar; // alan hesabı
    print("Uzun kenarı : $uzunKenar ve Kısa kenarı : $kisaKenar olan dikdörtgenin alanı $alan metrekaredir");
  }

  int factorialCalculator(int sayi1){
    int total = 1; // toplam 1 den başlayıp gelen sayı ile döngüde çarpılır.
    for(var i = sayi1; i >=1; i--){
      total *= i;
    }
    return total;
  }

  void letterCounter(String word){
    var counter = 0;
    for(var i = 0; i < word.length; i++ ){
      if(word[i] == 'e' || word[i] == 'E'){
        counter++; // Büyük yada küçük e harfi varsa saydırılır
      }
    }
    print("$word kelimesinde $counter tane e harfi vardır");
  }

  double angleCalculator(int totalEdge){
    if(totalEdge < 3){
      return 0; // kenarları toplamı 3 ten küçük ise 0 geri döner
    }else{
      var totalAngle = ( ( totalEdge - 2 ) * 180 ) / totalEdge;
      return totalAngle;
    }
  }

  double salaryCalculator(int workDay){
    if(workDay < 1){
      return 0; // çalıştığı gün sayısı 1 den küçük olamaz
    }else{

      int minWorkHour = 8; // 1 günde 8 saat çalışacak
      int overtimeHour = 150; // Mesai saat şım süresi 150

      int hourlySalary = 40; // normal çalışma saatlik ücret
      int overtimeSalary = 80; // Ekstra mesai saatlik ücret

      double totalSalary = 0; // Toplam ücret

      for(int i = 1; i <= workDay; i++){
        if(i*minWorkHour < overtimeHour){
          totalSalary += minWorkHour * hourlySalary;
        }else{
          totalSalary +=  minWorkHour * overtimeSalary;
        }
      }

      return totalSalary;
    }
  }

  double parkingCalculator(int parkingHour){
    if( parkingHour > 0 ){

      int hourlyPrice = 50; // saatlik ücreti 50 ₺
      int hourlyOvertimePrice = 10; // saatlik aşım ücreti 10 ₺
      double totalPrice = 0; // toplam ücret

      for(var i = 1; i <= parkingHour; i++){
        if(i <= 1){
          totalPrice += 1 * hourlyPrice;
        }else{
          totalPrice += 1 * hourlyOvertimePrice;
        }
      }

      return totalPrice;
    }else{
      return 0;
    }
  }

}