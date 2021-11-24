// PostRatingEvent ...
import '../../libs.dart';

class PostRatingEvent {}

// PostsLoadEvent ...
class PostsLoadEvent extends PostRatingEvent {}

// This class is merely to create an instance of Post Rating Init instance using the add method.
//  and for testing.
class PostRatingInitEvent extends PostRatingEvent {
  final MyPostsInit state;
  PostRatingInitEvent(this.state);
}

// RatePostEvent ... event
class RatePostEvent extends PostRatingEvent {
  String postID;
  int rate;
  RatePostEvent({required this.postID, required this.rate});
}

class PayToRatePostEvent extends PostRatingEvent {
  String account;
  String password;
  String postID;
  PayToRatePostEvent(this.account, this.password, this.postID);
}
