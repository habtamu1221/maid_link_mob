import "../../libs.dart";

class Navigation extends StatefulWidget {
  Navigation({Key? key}) : super(key: key);

  @override
  State createState() {
    return _NavigationState();
  }
}

class _NavigationState extends State<Navigation> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    Container(
                      // width: 100,
                      // height: 100,
                      decoration: BoxDecoration(),
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      child: BlocBuilder<UserBloc, UserState>(
                          builder: (context, state) {
                        // print((state as UserLoggedIn).user!.username);
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                final image = pickImage(context);
                                if (image != null) {
                                  image.then((value) {
                                    setState(() {
                                      imageFile = File(value!.path);
                                    });
                                  });
                                }
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Stack(
                                  children: [
                                    imageFile != null
                                        ? Image.file(
                                            imageFile!,
                                            // color: Colors.black,
                                            height: 100,
                                            width: 100,
                                          )
                                        : ((state as UserLoggedIn)
                                                    .user!
                                                    .imageUrl !=
                                                ""
                                            ? Image.network(
                                                StaticDataStore.URL +
                                                    (state as UserLoggedIn)
                                                        .user!
                                                        .imageUrl,
                                                height: 100,
                                                width: 100,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.asset(
                                                "assets/images/avatar.png",
                                                width: 100,
                                                height: 100,
                                              )),
                                    Positioned(
                                      bottom: 0,
                                      left: 10,
                                      width: 100,
                                      child: Container(
                                        color: Colors.black54,
                                        child: Icon(
                                          Icons.camera,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    state is UserLoggedIn
                                        ? (state as UserLoggedIn).user!.username
                                        : " UnNamed ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    state is UserLoggedIn
                                        ? (state as UserLoggedIn).user!.id
                                        : "-----------",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Profile"),
                      onTap: () {
                        Navigator.of(context).pushNamed(ProfileScreen.Route);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text("Settings"),
                      onTap: () {
                        Navigator.of(context).pushNamed(SettingScreen.Route);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.verified_user),
                      title: Text("My Maids"),
                    ),
                    ListTile(
                      leading: Icon(Icons.supervised_user_circle_sharp),
                      title: Text("Admins"),
                      onTap: () {
                        Navigator.of(context).pushNamed(AdminsScreen.Route);
                      },
                    ),
                    ListTile(
                        leading: Icon(Icons.supervised_user_circle_outlined),
                        title: Text("Clients")),
                    ListTile(
                        leading: Icon(Icons.privacy_tip_outlined),
                        title: Text("Security"),
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            SettingScreen.Route,
                          );
                        }),
                    ListTile(
                        leading: Icon(Icons.logout),
                        title: Text("Logout"),
                        onTap: () {
                          StaticDataStore.TOKEN = "";
                          StaticDataStore.role = Role.admin;
                          context.watch<ThemeBloc>().setTheme(1);
                          context.watch<UserBloc>().setState(UserInit());
                          Navigator.of(context).pushNamed(
                            AuthScreen.Route,
                          );
                        }),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.elliptical(400, 100),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Column(
                        children: [],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
