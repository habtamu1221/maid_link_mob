import '../../libs.dart';

class PostItem extends StatelessWidget {
  // const PostItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
            color: Theme.of(context).primaryColorLight,
            style: BorderStyle.solid),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  child: Container(
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        "assets/images/maidso.jpeg",
                        height: 65,
                        width: 65,
                      ),
                    ),
                  ),
                ),
                Text("Samuael Adnew Birhane",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          Stack(children: [
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 200,
                    child: Image.asset(
                      "assets/images/maidso.jpeg",
                    ),
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      "assets/images/maidso.jpeg",
                    ),
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      "assets/images/maidso.jpeg",
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              left: 0,
              bottom: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ]),
          Text("This is my biography ......"),
          Rating(rating: 4),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
