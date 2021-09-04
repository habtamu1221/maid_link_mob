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
      print(response.body);
      if (response != null &&
          (response.statusCode == 200 || response.statusCode == 201)) {
        try {
          print("User Succesfuly Loggd in ... ");
          var body = jsonDecode(response.body) as Map<String, dynamic>;
          StaticDataStore.TOKEN = body["token"];
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
}
