// AdminMaidsProvider
import 'dart:convert';
import '../../libs.dart';

class AdminMaidsProvider {
  static String HOST = StaticDataStore.HOST;
  static int PORT = StaticDataStore.PORT;
  static Client client = Client();

  AdminMaidsProvider();

  Future<List<Map<String, dynamic>>?> loadAdminMaids() async {
    final headers = {"Authorization": "Bearer ${StaticDataStore.TOKEN}"};
    try {
      var response = await client.get(
        Uri(
          scheme: "http",
          host: StaticDataStore.HOST,
          port: StaticDataStore.PORT,
          path: "/api/admin/maids/",
        ),
        headers: headers,
      );
      print("${response.body}  ${response.statusCode} ");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response.body) as List<dynamic>;
        final map = body.map<Map<String, dynamic>>((elem) {
          return (elem as Map<String, dynamic>);
        }).toList();
        print("Ecexuting .....$map ");
        // if (map == null) {
        //   return [];
        // }
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

  Future<Map<String, dynamic>?> registerMaid(
      String username, String email, String phone, String address) async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + StaticDataStore.TOKEN,
      };
      // header.
      var response = await client.post(
        Uri(scheme: "http", host: HOST, port: PORT, path: "/api/maid/new/"),
        headers: header,
        body: jsonEncode({
          "username": username,
          "email": email,
          "phone": phone,
          "address": address,
        }),
      );
      print(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        final body = jsonDecode(response.body);
        if (body['success']) {
          final user = body["user"] as Map<String, dynamic>;
          return user;
        } else {
          return null;
        }
      } else if (response.statusCode == 500 ||
          response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 501) {
        return null;
      }
    } catch (e, a) {
      return null;
    }
  }

  Future<bool> deleteMaid(String maidID) async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + StaticDataStore.TOKEN,
      };
      // header.
      var response = await client.get(
        Uri.parse(StaticDataStore.URL + "api/user/deactivate/?maid_id=$maidID"),
        headers: header,
      );
      print(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        final body = jsonDecode(response.body);
        if (body['msg'] != "") {
          return true;
        } else {
          return false;
        }
      } else if (response.statusCode == 500 ||
          response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 501) {
        print(jsonDecode(response.body));
        return false;
      }
      return false;
    } catch (e, a) {
      return false;
    }
  }
}
