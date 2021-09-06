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
}
