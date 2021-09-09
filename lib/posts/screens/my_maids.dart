import '../../libs.dart';

class MyMaids extends StatelessWidget {
  static const String Route = '/my_maids';
  final MyMaidsRepo repo;
  const MyMaids({Key? key, required this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myMaidsBloc = BlocProvider.of<MyMaidsBloc>(context);
    if (!(myMaidsBloc.state is MyMaidsLoadSuccess)) {
      myMaidsBloc.getMyMaids();
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
        child: BlocBuilder<MyMaidsBloc, MyMaidsState>(
          builder: (BuildContext context, MyMaidsState state) {
            if (state is MyMaidsLoading || state is MyMaidsInit) {
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
            } else if (state is MaidLoadingFailure) {
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
            } else if (state is MyMaidsLoadSuccess) {
              return ListView.builder(
                itemCount: (state as MyMaidsLoadSuccess).myMaids.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(MaidProfileScreen.Route,
                          arguments: {
                            "maid": (state as MyMaidsLoadSuccess).myMaids[index]
                          });
                    },
                    leading: (state as MyMaidsLoadSuccess)
                                .myMaids[index]
                                .user!
                                .imageUrl !=
                            ""
                        ? Image.network(
                            StaticDataStore.URL +
                                (state as MyMaidsLoadSuccess)
                                    .myMaids[index]
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
                    title: Text((state as MyMaidsLoadSuccess)
                        .myMaids[index]
                        .user!
                        .username),
                    subtitle: Text(
                      (state as MyMaidsLoadSuccess).myMaids[index].user!.email,
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
