import 'package:maidlink/libs.dart';
import 'package:bloc_test/bloc_test.dart';
import "package:test/test.dart";

void main() {
  MyRatingProvider provider = MyRatingProvider();
  MyRatingRepo repo = MyRatingRepo(provider);
  MyPostsInit init = MyPostsInit();
  group(" Post Rating Bloc Test ", () {
    blocTest<PostsRating, MyPostsRatingState>(
      " Post Rating Testing when Initialized ",
      build: () => PostsRating(repo),
      act: (bloc) {
        bloc.add(PostRatingInitEvent(init));
      },
      expect: () => [init],
    );
  });
}
