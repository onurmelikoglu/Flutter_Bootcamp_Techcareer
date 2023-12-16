class Kullanicilar {
  String userid;
  String username;
  String email;
  String password;
  String address;

  Kullanicilar({
    required this.userid,
    required this.username,
    required this.email,
    required this.password,
    required this.address,
  });

  factory Kullanicilar.fromJson(Map<dynamic, dynamic> json, String key) {
    return Kullanicilar(
      userid: key,
      username: json["username"] as String,
      email: json["email"] as String,
      password: json["password"] as String,
      address: json["address"] as String,
    );
  }
}
