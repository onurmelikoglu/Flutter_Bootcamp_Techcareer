import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HaritaSayfa extends StatefulWidget {
  const HaritaSayfa({super.key});

  @override
  State<HaritaSayfa> createState() => _HaritaSayfaState();
}

class _HaritaSayfaState extends State<HaritaSayfa> {
  // 40.981133,29.063053, 13z
  var baslangicKonum = CameraPosition(target: LatLng(40.981133, 29.063053), zoom: 15);
  Completer<GoogleMapController> haritaKontrol= Completer();

  Future<void> konumaGit() async{
    GoogleMapController controller = await haritaKontrol.future;
    // 41.0370175,28.974792,15z
    var gidilecekKonum = CameraPosition(target: LatLng(41.0370175, 28.974792), zoom: 15);
    controller.animateCamera(CameraUpdate.newCameraPosition(gidilecekKonum));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Harita"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: GoogleMap(
                  initialCameraPosition: baslangicKonum,
                  mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller){
                    haritaKontrol.complete(controller);
                },
              ),
            ),
            ElevatedButton(onPressed: (){
              konumaGit();
            }, child: const Text("Konuma Git"))
          ],
        ),
      ),
    );
  }
}
