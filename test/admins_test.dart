import "package:test/test.dart";
import "dart:convert";
import "../lib/libs.dart";

void main() {
  group('Admin JSON COnversion ', () {
    test("parse-admin-json", () {
      final json =
          """{ "id":"2389fsd78" , "username":"Habtamu Girma" , "email":"habtamu@email.com" , "image_url":"images/profile/jjkds7.jpg" , "role":1}""";
      expect(Admin.fromJson(jsonDecode(json) as Map<String, dynamic>).email,
          "habtamu@email.com");
      final admin = Admin(
        ID: "332kl",
        username: "biniam ",
        email: "biniam@gmail.com",
        imageUrl: "image/profile/p8987.jpg",
        role: 1,
      );
      expect(admin.username, "biniam ");
    });
  });
}
