import '../../libs.dart';

// This Bloc uses Posts in this case Maids and handles the Rating and Payment
//  to get the detail information of a single Post (Maid Instance Full Information).
class PostsRating extends Bloc<PostRatingEvent,
    MyPostsRatingState> /*Cubit<MyPostsRatingState>*/ {
  final MyRatingRepo repo;
  PostsRating(this.repo) : super(MyPostsInit());

  @override
  Stream<MyPostsRatingState> mapEventToState(PostRatingEvent event) async* {
    if (event is RatePostEvent) {
      final rateResult = await this.repo.ratePost(event.rate, event.postID);
      if (rateResult != null) {
        if (this.state is MyPostsLoadSuccess) {
          for (int a = 0;
              a < (this.state as MyPostsLoadSuccess).myPosts.length;
              a++) {
            if ((this.state as MyPostsLoadSuccess).myPosts[a]!.user!.id ==
                event.postID) {
              (this.state as MyPostsLoadSuccess).myPosts[a].rateCount =
                  rateResult.ratesCount;
              (this.state as MyPostsLoadSuccess).myPosts[a].rates =
                  rateResult.rates;
              (this.state as MyPostsLoadSuccess).myPosts[a].ratedBy =
                  rateResult.ratedBy;
              yield (MyPostsInit());
              yield (this.state);
            }
          }
        }
      }
    } else if (event is PayToRatePostEvent) {
      final Post = await this
          .repo
          .payForPostInformation(event.account, event.password, event.postID);
      if (Post != null) {
        if (this.state is MyPostsLoadSuccess) {
          (this.state as MyPostsLoadSuccess).myPosts.add(Post!);
        } else {
          yield (MyPostsInit());
          yield (MyPostsLoadSuccess([Post!]));
        }
      }
    } else if (event is PostsLoadEvent) {
      yield (MyPostsLoading());
      final Posts = await this.repo.getMyPosts();
      yield (MyPostsLoadSuccess(Posts!));
    }
  }
}
