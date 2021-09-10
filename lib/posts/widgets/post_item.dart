import '../../libs.dart';

class PostItem extends StatefulWidget {
  final Maid maid;
  PostItem({Key? key, required this.maid}) : super(key: key);

  @override
  State<PostItem> createState() {
    return _PostItemState();
  }
}

class _PostItemState extends State<PostItem> {
  bool showmore = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // post item is clicked and i am gonna do some thing .
        Navigator.of(context).pushNamed(MaidProfileScreen.Route,
            arguments: {"maid": widget.maid});
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
                        child: widget.maid.user != null &&
                                widget.maid.user!.imageUrl != null &&
                                widget.maid.user!.imageUrl != ""
                            ? Image.network(
                                StaticDataStore.URL +
                                    widget.maid.user!.imageUrl,
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
                    widget.maid.user!.username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            widget.maid.profileImages != null &&
                    widget.maid.profileImages.length > 0
                ? Container(
                    height: 400,
                    width: double.infinity,
                    child: Stack(
                      overflow: Overflow.clip,
                      children: [
                        Container(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.maid.profileImages != null &&
                                    widget.maid.profileImages.length > 0
                                ? widget.maid.profileImages.length
                                : 0,
                            itemBuilder: (conte, ind) {
                              return Image.network(
                                StaticDataStore.URL +
                                    widget.maid.profileImages[ind],
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                !showmore &&
                        widget.maid.bio != null &&
                        widget.maid.bio.length > 50
                    ? widget.maid.bio.substring(0, 20) + " ... "
                    : "${widget.maid.bio ?? ""}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            widget.maid.bio != null && widget.maid.bio.length > 50
                ? FlatButton(
                    onPressed: () {
                      setState(() {
                        showmore = !showmore;
                      });
                    },
                    child: Text(
                      showmore ? "show less" : "show more",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                : SizedBox(),
            RatingShowOnly(
              rating: widget.maid.rates,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
