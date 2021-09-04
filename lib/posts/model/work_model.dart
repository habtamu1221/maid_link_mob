class Work {
  String? ownerID;
  final int no;
  final int shift;
  final int type;
  final String experiance;
  final List<String> experties;

  Work({
    this.ownerID,
    required this.no,
    required this.shift,
    required this.type,
    required this.experiance,
    required this.experties,
  });

  factory Work.fromJson(Map<String, dynamic> json) {
    return Work(
        no: int.parse(json["no"]),
        shift: int.parse(json['shift']),
        type: int.parse(json['type']),
        experiance: json['experiance'],
        experties: json['experties']);
  }

  void setID(String id) {
    this.ownerID = id;
  }

  Map<String, dynamic> toJson() {
    return {
      "no": this.no,
      'shift': this.shift, //
      'type': this.type, //
      'experiance': this.experiance,
      'experties': this.experties,
      'owner_id': this.ownerID,
    };
  }
}
