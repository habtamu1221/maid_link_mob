class DClient extends User {
  late String ID;
  late String username;
  late String email;
  late String imageUrl;
  late int role;

  DClient({
    required this.ID,
    required this.username,
    required this.email,
    required this.imageUrl,
    required this.role,
  });

  factory DClient.fromJson(Map<String, dynamic> json) {
    return DClient(
      ID: json["id"],
      username: json['username'],
      email: json["email"],
      imageUrl: json["image_url"],
      role: int.parse(
        json['role'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.ID,
      "username": this.username,
      "email": this.email,
      "image_url": this.imageUrl,
      "role": this.role,
    };
  }
}

class User {}
