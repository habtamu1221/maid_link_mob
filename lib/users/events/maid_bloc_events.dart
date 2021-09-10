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

class MaidEventUpdateProfile extends MaidEvent {
  MaidUpdate update;
  MaidEventUpdateProfile(this.update);
}

class MaidEventCreateWork extends MaidEvent {
  Work work;
  MaidEventCreateWork(this.work);
}

class MaidEventUpdateWork extends MaidEvent {
  Work work;
  MaidEventUpdateWork(this.work);
}

class MaidEventDeleteWork extends MaidEvent {
  int no;
  MaidEventDeleteWork(this.no);
}
