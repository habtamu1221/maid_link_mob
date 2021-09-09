import '../../libs.dart';

class SeeMore extends StatelessWidget {
  const SeeMore(); // : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<PostBloc>(context).add(MaidPostEventLoad());
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: Theme.of(context).primaryColor,
            child: Row(
              children: [
                Text(
                  "See More ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
