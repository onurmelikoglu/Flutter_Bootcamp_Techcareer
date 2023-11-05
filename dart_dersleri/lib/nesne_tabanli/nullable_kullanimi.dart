void main(){
  // Nullable - Null Safety - Optional (Swift)
  String str = "Merhaba";

  // Tanımlama
  String? mesaj = null;

  // mesaj = "Hello";

  //Yöntem 1 : null ise uygulama çökmez, null değil ise çalışır
  print("Yöntem 1 : ${mesaj?.toUpperCase()}");

  //Yöntem 2 : null ise uygulama çöker, değil ise çalışır
  // print("Yöntem 2 : ${mesaj!.toUpperCase()}");

  //Yöntem 3 :
  if(mesaj != null){
    print("Yöntem 3 : ${mesaj.toUpperCase()}");
  }else{
    print("Mesaj null");
  }
}