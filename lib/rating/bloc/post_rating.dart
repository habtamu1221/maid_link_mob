import '../../libs.dart';

// This Bloc uses Posts in this case Maids and handles the Rating and Payment
//  to get the detail information of a single Post (Maid Instance Full Information).
class PostsRating extends Cubit<MyPostsRatingState> {
  final MyRatingRepo repo;
  PostsRating(this.repo) : super(MyPostsInit());

  getMyPosts() async {
    emit(MyPostsLoading());
    final Posts = await this.repo.getMyPosts();
    emit(MyPostsLoadSuccess(Posts!));
  }

  // payForPostInformation ...
  payForPostInformation(String account, String password, String PostID) async {
    final Post =
        await this.repo.payForPostInformation(account, password, PostID);
    if (Post != null) {
      if (this.state is MyPostsLoadSuccess) {
        (this.state as MyPostsLoadSuccess).myPosts.add(Post!);
      } else {
        emit(MyPostsLoadSuccess([Post!]));
      }
    }
  }

  ratePost(int rate, String PostID) async {
    final rateResult = await this.repo.ratePost(rate, PostID);
    if (rateResult != null) {
      if (this.state is MyPostsLoadSuccess) {
        for (int a = 0;
            a < (this.state as MyPostsLoadSuccess).myPosts.length;
            a++) {
          if ((this.state as MyPostsLoadSuccess).myPosts[a]!.user!.id ==
              PostID) {
            (this.state as MyPostsLoadSuccess).myPosts[a].rateCount =
                rateResult.ratesCount;
            (this.state as MyPostsLoadSuccess).myPosts[a].rates =
                rateResult.rates;
            (this.state as MyPostsLoadSuccess).myPosts[a].ratedBy =
                rateResult.ratedBy;
            emit(MyPostsInit());
            emit(this.state);
          }
        }
      }
    }
  }

  // -----------------

}
