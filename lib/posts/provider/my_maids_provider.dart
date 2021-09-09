import 'dart:convert';
import '../../libs.dart';

class MyMaidsProvider {
  static String HOST = StaticDataStore.HOST;
  static int PORT = StaticDataStore.PORT;
  static Client client = Client();

  MyMaidsProvider();

  Future<List<Map<String, dynamic>>?> getMyMaids() async {
    final headers = {"Authorization": "Bearer ${StaticDataStore.TOKEN}"};
    try {
      var response = await client.get(
        Uri(
          scheme: "http",
          host: StaticDataStore.HOST,
          port: StaticDataStore.PORT,
          path: "/api/client/maids/",
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

  Future<Map<String, dynamic>?> payForMaidInformation(
      String account, String password, String maidID) async {
    final headers = {"Authorization": "Bearer ${StaticDataStore.TOKEN}"};
    try {
      var response = await client.post(
        Uri(
          scheme: "http",
          host: StaticDataStore.HOST,
          port: StaticDataStore.PORT,
          path: "/api/maid/info/payment/",
        ),
        headers: headers,
        body: jsonEncode({
          "account": account,
          "password": password, //
          'maid_id': maidID,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        if (body != null) {
          final Map<String, dynamic> map = body["maid"] as Map<String, dynamic>;
          map['id'] = "${body["maid_id"]}";
          print("Succesfuly paid ${map}");
          return map;
        }
      }
      return null;
    } catch (e, a) {
      // print("  ERRORR ${e.toString()}");
      print(a);
      return null;
    }
  }

  Future<Map<String, dynamic>?> rateMaid(int rate, String maidID) async {
    final headers = {"Authorization": "Bearer ${StaticDataStore.TOKEN}"};
    try {
      var response = await client.get(
        Uri(
            scheme: "http",
            host: StaticDataStore.HOST,
            port: StaticDataStore.PORT,
            path: "/api/maid/rate/",
            // queryParameters: {
            //   "rate": rate,
            //   "maid_id": maidID,
            // },
            query: "rate=$rate&maid_id=$maidID"),
        headers: headers,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        if (body != null) {
          final Map<String, dynamic> map = body as Map<String, dynamic>;
          print(" Result After Rating  $map");
          map['id'] = "${body["maid_id"]}";
          return map;
        }
      }
      return null;
    } catch (e, a) {
      // print("  ERRORR ${e.toString()}");
      print(a);
      return null;
    }
  }
}
