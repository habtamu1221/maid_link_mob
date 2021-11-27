import "dart:io";

import 'package:maidlink/libs.dart';

class UserEvent {}

class UserLoginEvent extends UserEvent {
  String email;
  String password;
  UserLoginEvent(this.email, this.password);
}

class UserRegisterEvent extends UserEvent {
  String username;
  String email;
  String password;
  UserRegisterEvent(this.username, this.email, this.password);
}

class ChangePasswordEvent extends UserEvent {
  String oldPassword;
  String newPassword;
  ChangePasswordEvent(this.oldPassword, this.newPassword);
}

class UserDeactivateEvent extends UserEvent {}

class ChangeProfilePictureEvent extends UserEvent {
  File image;
  ChangeProfilePictureEvent(this.image);
}

class ChangeUsernameEvent extends UserEvent {
  String username;
  ChangeUsernameEvent(this.username);
}
