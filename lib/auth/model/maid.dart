import '../../libs.dart';

class Maid extends User {
  late String id;
  late String phone;
  late String address;
  late String bio;
  late List<String> carrers;
  late double rates;
  late int rateCount;
  DUser? user;
  Maid({
    required this.phone,
    required this.address,
    required this.bio,
    required this.carrers,
    required this.rates,
    required this.rateCount,
    required this.user,
  });

  factory Maid.fromJson(Map<String, dynamic> json) {
    // try {
    return Maid(
      phone: json["phone"],
      address: json["address"],
      bio: json["bio"],
      carrers: json["carrers"],
      rates: double.parse(json["rates"]),
      rateCount: int.parse(json["rate_count"]),
      user: null,
    );
  }

  Map<String, dynamic> ToJson() {
    return {
      "phone": this.phone,
      "address": this.address,
      "bio": this.bio, //
      "carrers": this.carrers,
      "rates": this.rates, //
      "rate_count": this.rateCount,
      // "username": this.username,
      // "email": this.email, //
      // "image_url": this.imageUrl, //
      // "role": this.role,
      // DUser
    };
  }
}

class DUser {
  late String id;
  late String username;
  late String email;
  late String imageUrl;
  late int role;

  DUser({
    required this.id,
    required this.username,
    required this.email,
    required this.imageUrl,
    required this.role,
  });

  factory DUser.fromJson(Map<String, dynamic> json) {
    return DUser(
      id: json["id"],
      username: json["username"],
      email: json['email'],
      imageUrl: json["image_url"],
      role: json['role'] is int ? json['role'] : int.parse(json['role']),
    );
  }
}

class ShortError {
  String err;
  ShortError({required this.err});

  factory ShortError.fromJson(Map<String, dynamic> json) {
    return ShortError(err: json['err']);
  }

  Map<String, dynamic> toJson() {
    return {
      "err": err,
    };
  }
}
