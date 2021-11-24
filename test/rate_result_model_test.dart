import "package:test/test.dart";
import "dart:convert";
import "../lib/libs.dart";

void main() {
  group('Rate Result Model Test ', () {
    test("parse-json", () {
      final json = """{
          "rates":4.5 , 
          "rated_by": [ "4534k5jl3" , "5l34jk5kl" ] , 
          "rate_count":2 }""";
      expect(
          RateResult.fromJson(jsonDecode(json) as Map<String, dynamic>).rates,
          4.5);
      expect(
          RateResult.fromJson(jsonDecode(json) as Map<String, dynamic>)
              .ratesCount,
          2);
      final rateResult = RateResult(
        rates: 4.5,
        ratesCount: 2,
        ratedBy: [
          "3423423",
          "4234234",
        ],
      );
      expect(rateResult.rates, 4.5);
    });
  });
}
