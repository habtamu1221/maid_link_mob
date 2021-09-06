import 'dart:convert';

import "../../libs.dart";
import 'package:http/http.dart';
// import 'encoding/json';

class UserProvider {
  // static const String HOST = StaticD.HOST;

  static String HOST = StaticDataStore.HOST;
  static int PORT = StaticDataStore.PORT;
  static Client client = Client();

  UserProvider();

  Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      var response = await client.post(
        Uri(scheme: "http", host: HOST, port: PORT, path: "/api/login/"),
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );
      // print(response.body);
      if (response != null &&
          (response.statusCode == 200 || response.statusCode == 201)) {
        try {
          print("User Succesfuly Loggd in ... ");
          var body = jsonDecode(response.body) as Map<String, dynamic>;
          StaticDataStore.TOKEN = body["token"];
          StaticDataStore.Password = password;
          return body["user"];
        } catch (e, a) {
          return null;
        }
      }
    } catch (e, a) {
      print(e.toString());
    }
    return null;
  }

  Future<Map<String, dynamic>?> registerClient(
      String username, String email, String password) async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + StaticDataStore.TOKEN,
      };
      // header.
      var response = await client.post(
        Uri(scheme: "http", host: HOST, port: PORT, path: "/api/client/new/"),
        headers: header,
        body: jsonEncode({
          "username": username,
          "email": email,
          "password": password,
        }),
      );
      print(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        final body = jsonDecode(response.body);
        if (body['success']) {
          final user = body["user"]['user'];
          return user;
        } else {
          return body;
        }
      } else if (response.statusCode == 500 ||
          response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 501) {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      }
    } catch (e, a) {
      return null;
    }
  }

  Future<bool> changePassword(String password, String confirm) async {
    try {
      print("$password $confirm");
      Map<String, String> header = {
        "Authorization": "Bearer " + StaticDataStore.TOKEN,
      };
      // header.
      var response = await client.post(
        Uri(scheme: "http", host: HOST, port: PORT, path: "/api/password/new/"),
        headers: header,
        body: jsonEncode({
          "password": password,
          "confirm": confirm,
        }),
      );
      print(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        final body = jsonDecode(response.body);
        if (body['new_password'] != "") {
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
