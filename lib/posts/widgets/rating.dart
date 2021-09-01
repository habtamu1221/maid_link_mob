import '../../libs.dart';

class Rating extends StatelessWidget {
  final int rating;
  const Rating({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.25),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Icon(
                (this.rating).round() >= 1 ? Icons.star : Icons.star_border,
                color: Theme.of(context).primaryColor),
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
                (this.rating).round() >= 2 ? Icons.star : Icons.star_border,
                color: Theme.of(context).primaryColor),
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
                (this.rating).round() >= 3 ? Icons.star : Icons.star_border,
                color: Theme.of(context).primaryColor),
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
                (this.rating).round() >= 4 ? Icons.star : Icons.star_border,
                color: Theme.of(context).primaryColor),
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
                (this.rating).round() >= 5 ? Icons.star : Icons.star_border,
                color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}
