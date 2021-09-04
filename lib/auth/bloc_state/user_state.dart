import '../../libs.dart';

class UserState {}

class UserLoggedIn extends UserState {
  final DUser user;
  UserLoggedIn(this.user);
}

class UserLoginOnProgress extends UserState {}

class UserLoginFailed extends UserState {}

class UserInit extends UserState {}

class LoginError extends UserState {}
