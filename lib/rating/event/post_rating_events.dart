// PostRatingEvent ...
import '../../libs.dart';

class PostRatingEvent {}

// PostsLoadEvent ...
class PostsLoadEvent extends PostRatingEvent {}

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
