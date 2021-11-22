import '../../libs.dart';

class MaidProfileScreen extends StatefulWidget {
  static const String Route = "/maids-show_profile";
  const MaidProfileScreen({Key? key}) : super(key: key);

  @override
  _MaidProfileScreenState createState() => _MaidProfileScreenState();
}

class _MaidProfileScreenState extends State<MaidProfileScreen> {
  Maid? maid;

  bool maidExistsInMyMaidsList(BuildContext contex, String maidID) {
    if (BlocProvider.of<PostsRating>(contex).state is MyPostsLoadSuccess) {
      for (int k = 0;
          k <
              (BlocProvider.of<PostsRating>(contex).state as MyPostsLoadSuccess)
                  .myPosts
                  .length;
          k++) {
        if ((BlocProvider.of<PostsRating>(contex).state as MyPostsLoadSuccess)
                .myPosts[k]!
                .user!
                .id ==
            maidID) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      maid = (ModalRoute.of(context)!.settings.arguments
          as Map<String, Maid>)["maid"];
    }

    if (maid == null) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.ROUTE, (route) => false);
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        // width: double.infinity,
        // height: MediaQuery.of(context).size.height * 0.8,
        child: BlocBuilder<PostsRating, MyPostsRatingState>(
          builder: (context, state) {
            return ListView(
              children: [
                (maid!.profileImages != null && maid!.profileImages.length > 0)
                    ? SizedBox(
                        child: MaidPictures(
                          pictures: maid!.profileImages,
                          ownerID: maid!.user!.id,
                        ),
                        height: MediaQuery.of(context).size.height * 0.23,
                        width: 200,
                      )
                    : SizedBox(),
                // AddPicture()
                UserProfile(user: maid!.user),
                (StaticDataStore.role == Role.client &&
                            maidExistsInMyMaidsList(context, maid!.user!.id)) ||
                        StaticDataStore.role == Role.admin
                    ? MaidProfile(
                        maid: this.maid!,
                      )
                    : SizedBox(),
                Container(
                  child: Center(
                    child: Text(
                      " Working Capacity ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ),
                WorksItems(works: maid!.works),
                (StaticDataStore.role == Role.client &&
                            maidExistsInMyMaidsList(context, maid!.user!.id)) ||
                        StaticDataStore.role == Role.maid ||
                        StaticDataStore.role == Role.admin
                    ? Rating(
                        rating: maid!.rates,
                        maidID: maid!.user!.id,
                        ratedBy: maid!.ratedBy,
                      )
                    : SizedBox(),
                maidExistsInMyMaidsList(context, maid!.user!.id)
                    ? SizedBox()
                    : StaticDataStore.role == Role.client
                        ? PayForMaidInfo(
                            maidid: maid!.user!.id,
                          )
                        : SizedBox(),
              ],
            );
          },
        ),
      ),
    );
  }
}
