import 'dart:convert';

import "../../libs.dart";
import 'package:http/http.dart';
// import 'encoding/json';

class MaidProvider {
  static String HOST = StaticDataStore.HOST;
  static int PORT = StaticDataStore.PORT;
  static Client client = Client();

  MaidProvider();

  // Future<Map<String, dynamic>?> login(String email, String password) async {
  //   try {
  //     var response = await client.post(
  //       Uri(scheme: "http", host: HOST, port: PORT, path: "/api/login/"),
  //       body: jsonEncode({
  //         "email": email,
  //         "password": password,
  //       }),
  //     );
  //     // print(response.body);
  //     if (response != null &&
  //         (response.statusCode == 200 || response.statusCode == 201)) {
  //       try {
  //         print("User Succesfuly Loggd in ... ");
  //         var body = jsonDecode(response.body) as Map<String, dynamic>;
  //         StaticDataStore.TOKEN = body["token"];
  //         StaticDataStore.Password = password;
  //         return body["user"];
  //       } catch (e, a) {
  //         return null;
  //       }
  //     }
  //   } catch (e, a) {
  //     print(e.toString());
  //   }
  //   return null;
  // }

  // Future<Map<String, dynamic>?> registerClient(
  //     String username, String email, String password) async {
  //   try {
  //     Map<String, String> header = {
  //       "Authorization": "Bearer " + StaticDataStore.TOKEN,
  //     };
  //     // header.
  //     var response = await client.post(
  //       Uri(scheme: "http", host: HOST, port: PORT, path: "/api/client/new/"),
  //       headers: header,
  //       body: jsonEncode({
  //         "username": username,
  //         "email": email,
  //         "password": password,
  //       }),
  //     );
  //     print(response.body);
  //     if (response.statusCode == 201 || response.statusCode == 200) {
  //       final body = jsonDecode(response.body);
  //       if (body['success']) {
  //         final user = body["user"]['user'];
  //         return user;
  //       } else {
  //         return body;
  //       }
  //     } else if (response.statusCode == 500 ||
  //         response.statusCode == 400 ||
  //         response.statusCode == 401 ||
  //         response.statusCode == 501) {
  //       print(jsonDecode(response.body));
  //       return jsonDecode(response.body);
  //     }
  //   } catch (e, a) {
  //     return null;
  //   }
  // }

  Future<Map<String, dynamic>?> getMaid() async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + StaticDataStore.TOKEN,
      };
      var response = await client.get(
        Uri.parse(
            StaticDataStore.URL + "/api/maid/?user_id=${StaticDataStore.id}"),
        headers: header,
      );
      print(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        print("Maid Information $body");
        return body;
      } else if (response.statusCode == 500 ||
          response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 501) {
        print(jsonDecode(response.body));
        return null;
      }
      return null;
    } catch (e, a) {
      return null;
    }
  }

  Future<bool> removeProfilePicture(String imageUrl) async {
    print("Deleting teh profile picture ... ");
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + StaticDataStore.TOKEN,
      };
      var response = await client.delete(
        Uri.parse(StaticDataStore.URL + "api/maid/profile/remove/"),
        body: jsonEncode({
          "image_url": imageUrl,
        }),
        headers: header,
      );
      print(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        if ((body["success"] as bool)) {
          return true;
        }
        return false;
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

  // addProfilePicture
  Future<SimpleMessage> addProfilePicture(File _image) async {
    final headers = {"Authorization", "Bearer ${StaticDataStore.TOKEN}"};
    // var stream = new http.ByteStream(DelegatingStream.typed(_image.openRead()));
    try {
      print("To Be Sent .... ");
      var stream = ByteStream(_image.openRead());
      var length = await _image.length();
      final Map<String, String> header = {
        "Authorization": "Bearer " + StaticDataStore.TOKEN
      };
      // var uri = Uri.parse("${HOST}api/user/img/");
      var request = MultipartRequest(
        "POST",
        Uri(
            host: StaticDataStore.HOST,
            scheme: "http",
            port: StaticDataStore.PORT,
            path: "/api/maid/profile/add/"),
      );

      var multipartFile =
          MultipartFile('image', stream, length, filename: "frmMoile.jpg");
      // add file to multipart
      request.files.add(multipartFile);
      request.headers.addAll(header);
      final response = await request.send();

      print(response.stream.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonBody = jsonDecode(await response.stream.bytesToString());
        print(jsonBody);
        if (jsonBody["msg"] != "") {
          return SimpleMessage(msg: jsonBody["msg"] as String, success: true);
        } else {
          return SimpleMessage(msg: "invalid response body", success: false);
        }
      }
      return SimpleMessage(msg: "", success: false);
    } catch (e) {
      print(e.toString());
      return SimpleMessage(msg: "server error ", success: false);
    }
  }

//   Future<SimpleMessage> changeProfilePicture(File _image) async {
//     final headers = {"Authorization", "Bearer ${StaticDataStore.TOKEN}"};
//     // var stream = new http.ByteStream(DelegatingStream.typed(_image.openRead()));

//     try {
//       print("To Be Sent .... ");
//       var stream = ByteStream(_image.openRead());
//       var length = await _image.length();
//       final Map<String, String> header = {
//         "Authorization": "Bearer " + StaticDataStore.TOKEN
//       };
//       // var uri = Uri.parse("${HOST}api/user/img/");
//       var request = MultipartRequest(
//         "POST",
//         Uri(
//             host: StaticDataStore.HOST,
//             scheme: "http",
//             port: StaticDataStore.PORT,
//             path: "/api/maid/"),
//       );

//       var multipartFile =
//           MultipartFile('image', stream, length, filename: "frmMoile.jpg");
//       // add file to multipart
//       request.files.add(multipartFile);
//       request.headers.addAll(header);
//       final response = await request.send();

//       print(response.stream.toString());
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final jsonBody = jsonDecode(await response.stream.bytesToString());
//         print(jsonBody);
//         if (jsonBody["msg"] != "") {
//           return SimpleMessage(msg: jsonBody["msg"] as String, success: true);
//         } else {
//           return SimpleMessage(msg: "invalid response body", success: false);
//         }
//       }
//       return SimpleMessage(msg: "", success: false);
//     } catch (e) {
//       print(e.toString());
//       return SimpleMessage(msg: "server error ", success: false);
//     }
//   }
}
