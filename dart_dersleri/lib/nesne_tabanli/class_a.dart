import 'package:dart_dersleri/nesne_tabanli/my_interface.dart';

class ClassA implements MyInteface {
  @override
  int degisken = 10;

  @override
  void method1() {
   print("Method1 Çalıştı");
  }

  @override
  String method2() {
    return "Method2 Çalıştı";
  }

}