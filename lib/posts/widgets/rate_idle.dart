import '../../libs.dart';

class RatingShowOnly extends StatelessWidget {
  final double rating;
  const RatingShowOnly({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.25),
      child: Row(
        children: [
          Icon((this.rating).round() >= 1 ? Icons.star : Icons.star_border,
              size: 26, color: Theme.of(context).primaryColor),
          Icon((this.rating).round() >= 2 ? Icons.star : Icons.star_border,
              size: 28, color: Theme.of(context).primaryColor),
          Icon((this.rating).round() >= 3 ? Icons.star : Icons.star_border,
              size: 30, color: Theme.of(context).primaryColor),
          Icon((this.rating).round() >= 4 ? Icons.star : Icons.star_border,
              size: 32, color: Theme.of(context).primaryColor),
          Icon((this.rating).round() >= 5 ? Icons.star : Icons.star_border,
              size: 34, color: Theme.of(context).primaryColor),
        ],
      ),
    );
  }
}
