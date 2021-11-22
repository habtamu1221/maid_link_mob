import '../../libs.dart';

class Rating extends StatelessWidget {
  final double rating;
  final String maidID;
  final List<String> ratedBy;
  const Rating({
    Key? key,
    required this.rating,
    required this.maidID,
    required this.ratedBy,
  }) : super(key: key);

  bool haveIRatedThisMaid() {
    for (int a = 0; a < this.ratedBy.length; a++) {
      if (this.ratedBy[a] == StaticDataStore.id) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.25),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              BlocProvider.of<PostsRating>(context)
                  .add(RatePostEvent(rate: 1, postID: maidID));
            },
            child: Icon(
                (this.rating).round() >= 1 ? Icons.star : Icons.star_border,
                size: 26,
                color: Theme.of(context).primaryColor),
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<PostsRating>(context)
                  .add(RatePostEvent(rate: 2, postID: maidID));
            },
            child: Icon(
                (this.rating).round() >= 2 ? Icons.star : Icons.star_border,
                size: 28,
                color: Theme.of(context).primaryColor),
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<PostsRating>(context)
                  .add(RatePostEvent(rate: 3, postID: maidID));
            },
            child: Icon(
                (this.rating).round() >= 3 ? Icons.star : Icons.star_border,
                size: 30,
                color: Theme.of(context).primaryColor),
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<PostsRating>(context)
                  .add(RatePostEvent(rate: 4, postID: maidID));
            },
            child: Icon(
                (this.rating).round() >= 4 ? Icons.star : Icons.star_border,
                size: 32,
                color: Theme.of(context).primaryColor),
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<PostsRating>(context)
                  .add(RatePostEvent(rate: 5, postID: maidID));
            },
            child: Icon(
                (this.rating).round() >= 5 ? Icons.star : Icons.star_border,
                size: 34,
                color: Theme.of(context).primaryColor),
          ),
          haveIRatedThisMaid()
              ? Icon(
                  Icons.done_all_rounded,
                  color: Theme.of(context).primaryColor,
                  // size: 34,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
