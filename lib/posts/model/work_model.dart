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
    print("\n\n\n\n$json\n\n${json['NO']}\n\n");

    return Work(
      no: int.parse("${json["NO"]}"),
      shift: int.parse("${json['Shift']}"),
      type: int.parse("${json['Type']}"),
      experiance: json['Experiance'],
      experties: (json['Experties'] as List<dynamic>).map((e) {
        return "$e";
      }).toList(),
    );
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
