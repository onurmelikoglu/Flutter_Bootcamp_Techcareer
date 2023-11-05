Future<void> main() async{
  print("Verinin alınması bekleniyor...");
  var veri = await veritabanindanVeriAl();
  print("Alınan veri : $veri");
}

Future<String> veritabanindanVeriAl() async{
  for(var i=1; i < 6; i++){
    Future.delayed(Duration(seconds: i),() => print("Veri Miktarı : %${i*20}"));
  }
  return Future.delayed(Duration(seconds: 5), () => "Merhaba");
}