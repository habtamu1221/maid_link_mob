import '../../libs.dart';

class MaidEvent {}

class MaidEventLoad extends MaidEvent {}

class MaidEventAddProfileImage extends MaidEvent {
  File image;
  MaidEventAddProfileImage(this.image);
}

class MaidEventRemoveProfilePicture extends MaidEvent {
  String imageurl;
  MaidEventRemoveProfilePicture(this.imageurl);
}
