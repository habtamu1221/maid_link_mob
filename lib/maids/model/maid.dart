import '../../libs.dart';

class Maid extends User {
  late String id;
  late String phone;
  late String address;
  late String bio;
  late List<String> carrers;
  late List<String> profileImages;
  late double rates;
  late int rateCount;
  late List<String> ratedBy;
  late List<Work> works;
  DUser? user;

  Maid({
    required this.phone,
    required this.address,
    required this.bio,
    required this.carrers,
    required this.rates,
    required this.rateCount,
    required this.user,
    required this.profileImages,
    required this.works,
    required this.ratedBy,
  });

  factory Maid.fromJson(Map<String, dynamic> json) {
    // try {
    if (json["works"] == null) {
      json["works"] = [];
    }
    final works = (json["works"] as List<dynamic>).map<Map<String, dynamic>>(
      (el) {
        return el as Map<String, dynamic>;
      },
    ).toList();
    works
      ..removeWhere((erls) {
        return erls == null;
      });
    final nworks = works.map<Work>((el) {
      return Work.fromJson(el);
    }).toList();
    print(json['rates']);
    final rateResult = RateResult.fromJson(json);
    return Maid(
      phone: json["phone"],
      address: json["address"],
      bio: json["bio"],
      carrers: json["carrers"] ?? [],
      rates: rateResult.rates,
      ratedBy: rateResult.ratedBy,
      // json["rates"] != null ? double.parse(json["rates"]) ?? 0 : 0,
      rateCount: rateResult.ratesCount,
      // json["rate_count"] != null ? int.parse(json["rate_count"]) ?? 0 : 0,
      user: DUser.fromJson(json["user"] as Map<String, dynamic>),
      profileImages: (json["profile_images"] as List<dynamic>).map(
        (el) {
          return (el as String);
        },
      ).toList(),
      works: nworks,
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
      "rated_by": this.ratedBy,
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
