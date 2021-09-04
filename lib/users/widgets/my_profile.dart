import '../../libs.dart';

class MyProfile extends StatefulWidget {
  MyProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<MyProfile> createState() {
    return _MyProfileState();
  }
}

class _MyProfileState extends State<MyProfile> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: Container(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return Row(children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
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
                  child: Container(
                    // margin: EdgeInsets.symmetric(
                    //   horizontal: 10,
                    //   vertical: 25,
                    // ),
                    // width: 200,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 25,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        // padding: EdgeInsets.all(30),
                        // margin: EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Stack(
                          children: [
                            imageFile != null
                                ? Image.file(
                                    imageFile!,
                                    // color: Colors.black,
                                    height: 100,
                                    width: 100,
                                  )
                                : ((state as UserLoggedIn).user!.imageUrl != ""
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
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ID          : ${(state as UserLoggedIn).user.id}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Username : ${(state as UserLoggedIn).user.username}"),
                    Text("Email    : ${(state as UserLoggedIn).user.email}"),

                    // Padding(
                    //   padding: EdgeInsets.all(10),
                    //   child: Text("${(state as UserLoggedIn).user }"),
                    // ),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Text(
                        StaticDataStore.roles[StaticDataStore.role.index],
                        style: TextStyle(
                          color: Colors.black38,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]);
          },
        ),
      ),
    );
  }
}
