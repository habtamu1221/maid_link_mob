import '../../libs.dart';

class AdminMaids extends StatelessWidget {
  static const String Route = '/admins-maid';
  // final MyMaidsRepo repo;
  const AdminMaids({
    Key? key,
    /*required this.repo*/
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("${StaticDataStore.role} ");
    if (StaticDataStore.role == Role.admin) {
      final adminMaidsBloc = BlocProvider.of<AdminMaidsBloc>(context);
      if (!(adminMaidsBloc.state is AdminMaidsLoadSuccess)) {
        print(" Loading ... ");
        adminMaidsBloc.loadAdminMaids();
      }
    }
    // final myMaidsBloc = BlocProvider.of<MyMaidsBloc>(context);
    // if (!(myMaidsBloc.state is MyMaidsLoadSuccess)) {
    //   myMaidsBloc.getMyMaids();
    // }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AdminMaidRegisterScreen.Route);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
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
        child: BlocBuilder<AdminMaidsBloc, AdminMaidsState>(
          builder: (BuildContext context, AdminMaidsState state) {
            if (state is AdminMaidsLoading || state is AdminMaidsInit) {
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
            } else if (state is AdminMaidLoadingFailure) {
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
            } else if (state is AdminMaidsLoadSuccess) {
              return ListView.builder(
                itemCount: (state).myMaids.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      // Navigator.of(context).pushNamed(AdminMaidProfileScreen.Route,
                      //     arguments: {
                      //       "maid": (state as MyMaidsLoadSuccess).myMaids[index]
                      //     });
                    },
                    leading: (state).myMaids[index].user!.imageUrl != ""
                        ? Image.network(
                            StaticDataStore.URL +
                                (state).myMaids[index].user!.imageUrl,
                            height: 65,
                            width: 65,
                          )
                        : Image.asset(
                            "assets/images/maidso.jpeg",
                            height: 65,
                            width: 65,
                          ), //
                    title: Text((state).myMaids[index].user!.username),
                    subtitle: Text(
                      (state).myMaids[index].user!.email,
                    ),
                    trailing: GestureDetector(
                      onTap: () async {
                        final success =
                            await BlocProvider.of<AdminMaidsBloc>(context)
                                .deleteMaid(
                          (state).myMaids[index].user!.id,
                        );
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
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
