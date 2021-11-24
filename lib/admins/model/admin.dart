import '../../libs.dart';

class Admin extends User {
  late String ID;
  late String username;
  late String email;
  late String imageUrl;
  late int role;

  Admin({
    required this.ID,
    required this.username,
    required this.email,
    required this.imageUrl,
    required this.role,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      ID: json["id"],
      username: json['username'],
      email: json['email'],
      imageUrl: json["image_url"],
      role: int.parse("${json["role"]}"),
    );
  }

  Map<String, dynamic> tojson() {
    return {
      "id": this.ID,
      "username": this.username,
      'email': this.email,
      'image_url': this.imageUrl,
      "role": this.role,
    };
  }
}
