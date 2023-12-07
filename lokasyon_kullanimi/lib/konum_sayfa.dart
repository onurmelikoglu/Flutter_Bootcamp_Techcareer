import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class KonumSayfa extends StatefulWidget {
  const KonumSayfa({super.key});

  @override
  State<KonumSayfa> createState() => _KonumSayfaState();
}

class _KonumSayfaState extends State<KonumSayfa> {
  double enlem = 0.0;
  double boylam = 0.0;

  Future<void> konumBilgisiAl() async {
    var konum = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      enlem = konum.latitude;
      boylam = konum.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Konum"),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Enlem : $enlem"),
            Text("Boylam : $boylam"),
            ElevatedButton(onPressed: (){
              konumBilgisiAl();
            }, child: const Text("Konum Al"))
          ],
        ),
      ),
    );
  }
}
