import 'dart:convert';

import "../../libs.dart";
import 'package:http/http.dart';

// import 'encoding/json';
class MaidPostProvider {
  static Client client = Client();

  MaidPostProvider();

  Future<List<Map<String, dynamic>>?> loadMaids(int offset) async {
    final headers = {"Authorization": "Bearer ${StaticDataStore.TOKEN}"};
    print("Loading clients ");
    try {
      var response = await client.get(
        Uri(
          scheme: "http",
          host: StaticDataStore.HOST,
          port: StaticDataStore.PORT,
          path: "/api/maids/",
          // queryParameters: {
          //   "offset": offset,
          //   "limit": 3,
          // },
        ),
        headers: headers,
      );

      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response.body) as List<dynamic>;
        final map = body.map<Map<String, dynamic>>((elem) {
          return (elem as Map<String, dynamic>);
        }).toList();
        print(map);
        return map;
      } else {
        return null;
      }
    } catch (e, a) {
      print("  ERRORR ${e.toString()}");
      print(a);
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> searchMaids(
      String text, int offset) async {
    final headers = {"Authorization": "Bearer ${StaticDataStore.TOKEN}"};
    try {
      var response = await client.get(
        Uri(
          scheme: "http",
          host: StaticDataStore.HOST,
          port: StaticDataStore.PORT,
          path: "/api/search/maids/",
          queryParameters: {
            "offset": offset,
            "limit": 3,
            "q": text,
          },
        ),
        headers: headers,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response.body) as List<dynamic>;
        final map = body.map<Map<String, dynamic>>((elem) {
          return (elem as Map<String, dynamic>);
        }).toList();
        print(map);
        return map;
      } else {
        return null;
      }
    } catch (e, a) {
      // print("  ERRORR ${e.toString()}");
      print(a);
      return null;
    }
  }
}
