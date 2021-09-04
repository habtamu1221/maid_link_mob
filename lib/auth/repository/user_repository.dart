import "../../libs.dart";

class UserRepo {
  final UserProvider provider;
  UserRepo(this.provider);

  Future<DUser?> loginUser(String email, String password) async {
    final map = await provider.login(email, password);
    if (map == null) {
      return null;
    }
    final user = DUser.fromJson(map);
    print(map);
    return user;
  }
}
