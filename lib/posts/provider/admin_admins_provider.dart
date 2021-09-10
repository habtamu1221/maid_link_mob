// AdminMaidsProvider
import 'dart:convert';
import '../../libs.dart';

class AdminAdminsProvider {
  static String HOST = StaticDataStore.HOST;
  static int PORT = StaticDataStore.PORT;
  static Client client = Client();

  AdminAdminsProvider();

  Future<List<Map<String, dynamic>>?> loadAdminAdmins() async {
    final headers = {"Authorization": "Bearer ${StaticDataStore.TOKEN}"};
    try {
      var response = await client.get(
        Uri(
          scheme: "http",
          host: StaticDataStore.HOST,
          port: StaticDataStore.PORT,
          path: "/api/admins/",
        ),
        headers: headers,
      );
      print("${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response.body) as List<dynamic>;
        final map = body.map<Map<String, dynamic>>((elem) {
          return (elem as Map<String, dynamic>);
        }).toList();
        return map;
      } else {
        return null;
      }
    } catch (e, a) {
      print(a);
      return null;
    }
  }

  Future<Map<String, dynamic>?> registerAdmin(
      String username, String email) async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + StaticDataStore.TOKEN,
      };
      // header.
      var response = await client.post(
        Uri(scheme: "http", host: HOST, port: PORT, path: "/api/admin/new/"),
        headers: header,
        body: jsonEncode({
          "username": username,
          "email": email,
          "password": "1234",
        }),
      );
      print(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        final body = jsonDecode(response.body);
        if (body['success']) {
          final admin = body["admin"] as Map<String, dynamic>;
          return admin;
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

  Future<bool> deleteAdmin(String adminID) async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + StaticDataStore.TOKEN,
      };
      var response = await client.delete(
        Uri.parse(StaticDataStore.URL + "api/admin/?admin_id=$adminID"),
        headers: header,
      );
      print(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        final body = jsonDecode(response.body);
        if (body['msg'] != "") {
          return true;
        }
        return false;
      } else if (response.statusCode == 500 ||
          response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 501) {
        return false;
      }
    } catch (e, a) {
      return false;
    }
    return false;
  }
}
