/*

{
  "rates" : 4.5,
  "rated_by" : [ "61202c884749ecd3d252843c"  , "61202c884749ecd3d252843c" , "61202c884749ecd3d252843c" ] , 
  "rate_count" : 3,
}


*/
class RateResult {
  double rates;
  int ratesCount;
  List<String> ratedBy;
  RateResult(
      {required this.rates, required this.ratesCount, required this.ratedBy});

  factory RateResult.fromJson(Map<String, dynamic> json) {
    return RateResult(
      rates: double.parse("${json['rates']}"),
      ratedBy: json['rated_by'] != null
          ? json['rated_by'].map<String>(
              (e) {
                return "$e";
              },
            ).toList()
          : [], //
      ratesCount: int.parse("${json['rate_count']}"),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "rates": this.rates,
      "rated_by": this.ratedBy,
      "rate_count": this.ratesCount,
    };
  }
}
