class MaidUpdate {
  String id;
  String address;
  String phone;
  String bio;

  MaidUpdate(
      {required this.id,
      required this.address,
      required this.phone,
      required this.bio});

  factory MaidUpdate.fromJson(Map<String, dynamic> json) {
    return MaidUpdate(
      address: json["address"] ?? '',
      bio: json['bio'] ?? "",
      phone: json['phone'] ?? "",
      id: json['id'] ?? "",
    );
  }
}
