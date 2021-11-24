import "package:test/test.dart";
import "dart:convert";
import "../lib/libs.dart";

void main() {
  group(' Client JSON Conversion Test ', () {
    test("parse-client-json", () {
      final json =
          """{ "id":"2389fsd78" , "username":"Someuser Adane" , "email":"someclient@email.com" , "image_url":"images/profile/jjksdfsd.jpg" , "role":2}""";
      expect(Admin.fromJson(jsonDecode(json) as Map<String, dynamic>).email,
          "someclient@email.com");
      final admin = Admin(
        ID: "fsd534",
        username: "client ",
        email: "client@gmail.com",
        imageUrl: "image/profile/clients9090.jpg",
        role: 1,
      );
      expect(admin.username, "client ");
    });
  });
}
