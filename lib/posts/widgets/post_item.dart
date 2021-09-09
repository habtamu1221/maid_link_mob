import '../../libs.dart';

class PostItem extends StatelessWidget {
  final Maid maid;
  PostItem({Key? key, required this.maid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // post item is clicked and i am gonna do some thing .
        Navigator.of(context)
            .pushNamed(MaidProfileScreen.Route, arguments: {"maid": this.maid});
      },
      child: Container(
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
                        child: maid.user != null &&
                                maid.user!.imageUrl != null &&
                                maid.user!.imageUrl != ""
                            ? Image.network(
                                StaticDataStore.URL + maid.user!.imageUrl,
                                height: 65,
                                width: 65,
                              )
                            : Image.asset(
                                "assets/images/maidso.jpeg",
                                height: 65,
                                width: 65,
                              ),
                      ),
                    ),
                  ),
                  Text(
                    maid.user!.username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            maid.profileImages != null && maid.profileImages.length > 0
                ? Container(
                    height: 400,
                    width: double.infinity,
                    child: Stack(
                      overflow: Overflow.clip,
                      children: [
                        Container(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: maid.profileImages != null &&
                                    maid.profileImages.length > 0
                                ? maid.profileImages.length
                                : 0,
                            itemBuilder: (conte, ind) {
                              return Image.network(
                                StaticDataStore.URL + maid.profileImages[ind],
                                height: 200,
                              );
                            },
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
                      ],
                    ),
                  )
                : SizedBox(),
            Text("${maid.bio ?? ""}"),
            RatingShowOnly(
              rating: maid.rates,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
