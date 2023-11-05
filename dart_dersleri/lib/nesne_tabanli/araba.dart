class Araba{
  String renk;
  int hiz;
  bool calisiyorMu;

  /*Araba(String renk, int hiz, bool calisiyorMu){
    this.renk = renk;
    this.hiz = hiz;
    this.calisiyorMu = calisiyorMu;
  }*/

  Araba({required this.renk, required this.hiz, required this.calisiyorMu});
  // this = Araba sınıfı

  void calistir(){ // Side effect : methodun sınıfın özelliğini değiştirmesi
    hiz = 5;
    calisiyorMu = true;
  }

  void durdur(){
    hiz = 0;
    calisiyorMu = false;
  }

  void hizlan(int km){
    // hiz = hiz + km;
    hiz += km;
  }

  void yavasla(int km){
    hiz -= km;
  }

  void bilgiAl(){
    print("------------------");
    print("Renk : ${renk}");
    print("Hız : ${hiz}");
    print("Çalışıyor Mu ? : ${calisiyorMu}");
  }
}