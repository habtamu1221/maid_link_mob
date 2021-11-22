import '../../libs.dart';

class MyMaids extends StatelessWidget {
  static const String Route = '/my_maids';
  final MyRatingRepo repo;
  const MyMaids({Key? key, required this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postsRating = BlocProvider.of<PostsRating>(context);
    if (!(postsRating.state is MyPostsLoadSuccess)) {
      postsRating.getMyPosts();
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "My Maids",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: BlocBuilder<PostsRating, MyPostsRatingState>(
          builder: (BuildContext context, MyPostsRatingState state) {
            if (state is MyPostsLoading || state is MyPostsInit) {
              return Center(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "Loading...",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                      CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is PostLoadingFailure) {
              return Center(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "Loading Failed",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                      Icon(
                        Icons.error_outline,
                        size: 40,
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is MyPostsLoadSuccess) {
              return ListView.builder(
                itemCount: (state as MyPostsLoadSuccess).myPosts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(MaidProfileScreen.Route,
                          arguments: {
                            "maid": (state as MyPostsLoadSuccess).myPosts[index]
                          });
                    },
                    leading: (state as MyPostsLoadSuccess)
                                .myPosts[index]
                                .user!
                                .imageUrl !=
                            ""
                        ? Image.network(
                            StaticDataStore.URL +
                                (state as MyPostsLoadSuccess)
                                    .myPosts[index]
                                    .user!
                                    .imageUrl,
                            height: 65,
                            width: 65,
                          )
                        : Image.asset(
                            "assets/images/maidso.jpeg",
                            height: 65,
                            width: 65,
                          ), //
                    title: Text((state as MyPostsLoadSuccess)
                        .myPosts[index]
                        .user!
                        .username),
                    subtitle: Text(
                      (state as MyPostsLoadSuccess).myPosts[index].user!.email,
                    ),
                  );
                },
              );
            }
            return Center(
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Loading Failed",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    ),
                    Icon(
                      Icons.error_outline,
                      size: 40,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
