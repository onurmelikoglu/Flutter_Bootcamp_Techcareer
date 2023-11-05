void main(){
  // 1. Compile error
  // int x = 10

  // 2. Runtime error(Exception)
  var liste = <String>[];
  liste.add("Ali");
  liste.add("Ece");



  try{
    String isim = liste[2];
    print("Gelen isim : $isim");
  }catch(e){
    print("Listenin boyutunu aştınız : $e");
  }
}