// import 'package:http/http.dart' as http;
import 'package:test/test.dart';
import 'dart:convert';
import '../lib/libs.dart';

void main() {
  group(" JSON decoding ", () {
    test("parse-posts-json", () {
      final json =
          """{"NO":"2","Shift":"1","Type":"1","Experiance":"Cake Bread","Experties":["One","Two","Three"]}""";
      expect(Work.fromJson(jsonDecode(json) as Map<String, dynamic>).no, 2);
    }, skip: false);

    // -------------------------------
    test("User-from-json", () {
      final json =
          '{"id":"61202c884749ecd3d252843c","username":"samuael","email":"newemail@email.com","password":"passme","image_url":"","role":0}';
      expect(DUser.fromJson(jsonDecode(json) as Map<String, dynamic>).role, 0);
    }, skip: false);

    test("Rate-JSON-decode-test", () {
      final json =
          """{"rates":4.5,"rated_by":["61202c884749ecd3d252843c","61202c884749ecd3d252843c","61202c884749ecd3d252843c"],"rate_count":3}""";
      expect(
          RateResult.fromJson(jsonDecode(json) as Map<String, dynamic>)
              .ratesCount,
          3);
    }, skip: false);
  }, skip: false);
}
