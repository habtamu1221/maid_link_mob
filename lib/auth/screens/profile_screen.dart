import "../../libs.dart";

class ProfileScreen extends StatefulWidget {
  static String Route = "/profile/screen";
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    print("ROLE : ${StaticDataStore.role}");
    if (StaticDataStore.role == Role.maid &&
        !(BlocProvider.of<MaidBloc>(context).state is MaidBlocLoadingSuccess)) {
      BlocProvider.of<MaidBloc>(context).add(MaidEventLoad());
    }
    return Scaffold(
      floatingActionButton: StaticDataStore.role == Role.maid
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProfileScreen.Route);
              },
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            )
          : null,
      appBar: AppBar(
          elevation: 0,
          title: Text(
            " Profile Screen ",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
              ),
            ),
          ]),
      body: Container(
        child: ListView(
          children: [
            (StaticDataStore.role == Role.maid)
                ? BlocBuilder<MaidBloc, MaidBlocState>(
                    builder: (context, state) {
                      if (state is MaidBlocLoadingSuccess) {
                        return SizedBox(
                          child: MaidPictures(
                            pictures: (state).maid.profileImages,
                            ownerID: (state).maid.user!.id,
                          ),
                          height: MediaQuery.of(context).size.height * 0.23,
                          width: 200,
                        );
                        // });
                      } else {
                        return Center(
                          child: Container(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  )
                : SizedBox(),
            StaticDataStore.role == Role.maid
                ? BlocBuilder<MaidBloc, MaidBlocState>(
                    builder: (context, state) {
                    return AddPicture();
                  })
                : SizedBox(),
            MyProfile(),
            // UserProfile(user: maid!.user),
            (StaticDataStore.role == Role.maid)
                ? BlocBuilder<MaidBloc, MaidBlocState>(
                    builder: (context, state) {
                    if (state is MaidBlocLoadingSuccess) {
                      return MaidProfile(
                        maid: state.maid,
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  })
                : SizedBox(),
// ----------------------------------------------
            (StaticDataStore.role == Role.maid)
                ? BlocBuilder<MaidBloc, MaidBlocState>(
                    builder: (context, state) {
                    if (state is MaidBlocLoadingSuccess) {
                      return WorksItems(works: state.maid.works);
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  })
                : SizedBox(),
            (StaticDataStore.role == Role.maid)
                ? BlocBuilder<MaidBloc, MaidBlocState>(
                    builder: (context, state) {
                    if (state is MaidBlocLoadingSuccess) {
                      return Rating(
                        rating: state.maid.rates,
                        maidID: state.maid.user!.id,
                        ratedBy: state.maid.ratedBy,
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  })
                : SizedBox(),

            //
            //
          ],
        ),
      ),
    );
  }
}
