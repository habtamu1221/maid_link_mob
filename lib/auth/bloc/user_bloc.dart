import '../../libs.dart';

class UserBloc extends Cubit<UserState> {
  UserRepo repo;
  UserBloc(this.repo) : super(UserInit());

  setState(UserState ustate) {
    emit(ustate);
  }

  Future<UserState> loginUser(String email, String password) async {
    emit(UserLoginOnProgress());
    final user = await this.repo.loginUser(email, password);
    if (user == null) {
      if (state is UserLoggedIn) {
        return this.state;
      }
      emit(UserLoginFailed());
    } else {
      emit(UserLoggedIn(user));
      // print("User logged in");
    }
    return this.state;
  }

  Future<Object?> registerClient(
      String username, String email, String password) async {
    final client = await this.repo.registerClient(username, email, password);
    return client;
  }

  Future<bool> changePassword(String oldPassword, String newPassword) async {
    return await this.repo.changePassword(oldPassword, newPassword);
  }

  Future<bool> deactivate() async {
    return await this.repo.deactivate();
  }

  Future<SimpleMessage> changeProfilePicture(File image) async {
    final mess = await this.repo.changeProfilePicture(image);
    if (mess.success && this.state is UserLoggedIn) {
      (this.state as UserLoggedIn).user.imageUrl = mess.msg;
      emit(this.state);
    }
    return mess;
  }

  // Future<SimpleMessage> addProfilePicture(File image) async {
  //   final mess = await this.repo.addProfilePicture(image);
  //   if (mess.success && this.state is UserLoggedIn) {
  //     (this.state as UserLoggedIn). = mess.msg;
  //     emit(this.state);
  //   }
  //   return mess;
  // }

  Future<String> changeUsername(String username) async {
    final mess = await this.repo.changeUsername(username);
    if (mess != "") {
      print("Username Changed to $mess");
      (this.state as UserLoggedIn).user.username = mess;
      emit(this.state);
    }
    return mess;
  }
}
