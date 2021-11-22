import '../../libs.dart';

class MyPostsRatingState {}

class MyPostsInit extends MyPostsRatingState {}

class MyPostsLoading extends MyPostsRatingState {}

class MyPostsLoad extends MyPostsRatingState {
  List<PostItem> myPosts;
  MyPostsLoad(this.myPosts);
}

class MyPostsLoadSuccess extends MyPostsRatingState {
  List<Maid> myPosts;
  MyPostsLoadSuccess(this.myPosts);
}

class PostLoadingFailure extends MyPostsRatingState {}

class PostAddedState extends MyPostsRatingState {}
