import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groceryshopping/data/entity/kullanicilar.dart';

class KullanicilarDaoRepository{

  var collectionKullanicilar = FirebaseFirestore.instance.collection("kullanicilar");
  var firebaseAuth = FirebaseAuth.instance;

  Future<Kullanicilar?> getCurrentUser() async {
    var user = firebaseAuth.currentUser;

    if (user != null) {
      var sorgu = collectionKullanicilar.where("email", isEqualTo: user.email.toString());

      try {
        var querySnapshot = await sorgu.get();

        if (querySnapshot.docs.isNotEmpty) {
          var document = querySnapshot.docs.first;
          var data = document.data();
          var key = document.id;
          var kullanici = Kullanicilar.fromJson(data, key);

          return kullanici;
        }
      } catch (e) {
        print("Error: $e");
      }
    }
    return null;
  }




  Future<void> signIn(String email, String password) async{
    try{
      final UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if(userCredential.user != null){
        print("Giriş Başarılı: ${userCredential.user}");
      }
    } on FirebaseAuthException catch(e){
      print("Bir sorun oluştu: $e");
    }
  }

  Future<void> signUp(String username, String email, String password) async{
    try{
      final UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if(userCredential.user != null){
        registerUser(username, email, password);
      }
    } on FirebaseAuthException catch(e){
      print("Bir sorun oluştu: $e");
    }
  }

  Future<void> registerUser(String username, String email, String password) async{
    var yeniKisi = HashMap<String,dynamic>();
    yeniKisi["username"] = username;
    yeniKisi["email"] = email;
    yeniKisi["password"] = password;

    collectionKullanicilar.add(yeniKisi);
  }

  Future<void> signOut() async{
    await firebaseAuth.signOut();
  }



}