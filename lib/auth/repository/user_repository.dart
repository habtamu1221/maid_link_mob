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
    if (user != null) {
      StaticDataStore.id = user.id;
      StaticDataStore.role = Role.values[user.role];
    }
    print(map);
    return user;
  }

  Future<Object?> registerClient(
      String username, String email, String password) async {
    final client = await provider.registerClient(username, email, password);
    if (client == null) return null;
    if (client!["id"] != null &&
        (client!["id"] as String) != null &&
        (client['id'] as String) != '') {
      print("Client printing .... ");
      return DUser.fromJson(client);
    } else if (client != null) {
      print(" ERROR GENERATING ");
      return ShortError.fromJson(client);
    } else {
      print("INternl server error printing ... ");
      return null;
    }
  }

  Future<bool> changePassword(String oldPassword, String newPassword) async {
    return provider.changePassword(oldPassword, newPassword);
  }

  Future<bool> deactivate() async {
    return provider.deactivate();
  }

  Future<SimpleMessage> changeProfilePicture(File image) {
    return this.provider.changeProfilePicture(image);
  }


  Future<String> changeUsername(String username) {
    return this.provider.changeUsername(username);
  }
}
