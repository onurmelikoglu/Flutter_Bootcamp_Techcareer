import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  String alinanVeri = "";
  String resimAdi = "baklava.png";
  bool switchKontrol = false;
  bool checkboxKontrol = false;
  int radioDeger = 0;
  bool progressKontrol = false;
  double ilerleme = 30.0;

  var tfControl = TextEditingController();
  var tfSaat = TextEditingController();
  var tfTarih = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widgets Kullanimi"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(alinanVeri),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32),
              child: TextField(
                controller: tfControl,
                decoration: const InputDecoration(hintText: "Veri"),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                alinanVeri = tfControl.text;
              });
            }, child: const Text("Oku")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    resimAdi = "kofte.png";
                  });
                }, child: const Text("Resim 1")),
                // Image.asset("resimler/$resimAdi"),
                SizedBox(
                    width: 72,
                    height: 72,
                    child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/$resimAdi")
                ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    resimAdi = "ayran.png";
                  });
                }, child: const Text("Resim 2")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  SizedBox(
                    width: 150,
                    child: SwitchListTile(
                        title: const Text("Dart"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: switchKontrol,
                        onChanged: (veri){
                          setState(() {
                            switchKontrol = veri;
                          });
                        }
                    ),
                  ),
                SizedBox(
                  width: 150,
                  child: CheckboxListTile(
                      title: const Text("Flutter"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: checkboxKontrol,
                      onChanged: (veri){
                        setState(() {
                          checkboxKontrol = veri!;
                        });
                      }
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 200,
                  child: RadioListTile(
                    title: const Text("Barcelona"),
                      value: 1,
                      groupValue: radioDeger,
                      onChanged: (veri){
                        setState(() {
                          radioDeger = veri!;
                        });
                      }
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: RadioListTile(
                      title: const Text("Reel Madrid"),
                      value: 2,
                      groupValue: radioDeger,
                      onChanged: (veri){
                        setState(() {
                          radioDeger = veri!;
                        });
                      }
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    progressKontrol = true;
                  });
                }, child: const Text("Basla")),
                Visibility(visible: progressKontrol,child: CircularProgressIndicator()),
                ElevatedButton(onPressed: (){
                  setState(() {
                    progressKontrol = false;
                  });
                }, child: const Text("Dur")),
              ],
            ),
            Text(ilerleme.toInt().toString()),
            Slider(max:100.0, min:0.0, value: ilerleme, onChanged: (veri){
              setState(() {
                ilerleme = veri;
              });
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 120,
                  child: TextField(
                    controller: tfSaat,
                    decoration: const InputDecoration(hintText: "Saat"),
                  ),
                ),
                IconButton(onPressed: (){

                }, icon: Icon(Icons.access_time))
              ],
            ),
            ElevatedButton(onPressed: (){
              print("Switch durum : $switchKontrol");
              print("Checkbox durum : $checkboxKontrol");
              print("Radio durum : $radioDeger");
              print("İlerleme durum : $ilerleme");
            }, child: const Text("Göster")),

          ],
        ),
      ),
    );
  }
}
