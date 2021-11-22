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
  bool editing = false;
  Color buttonColor = Colors.grey;
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: Container(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            usernameController.text = (state as UserLoggedIn).user!.username;
            return Row(children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () async {
                    final image = pickImage(context);
                    // if (image != null) {
                    image.then((value) async {
                      final file = File(value!.path);
                      final simpleMessage =
                          await BlocProvider.of<UserBloc>(context)
                              .changeProfilePicture(file!);

                      if (simpleMessage.success) {
                        // setState(() {
                        //   imageFile = file;
                        // });
                        print(simpleMessage.success);
                        print("changed");
                        print(StaticDataStore.URL +
                            (state as UserLoggedIn).user!.imageUrl);
                      } else {
                        print(StaticDataStore.URL +
                            (state as UserLoggedIn).user!.imageUrl);
                        // do notiong
                      }
                    });
                    // }
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
                      "User name :",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Text("Username  "),
                        // Text(
                        //   "${(state as UserLoggedIn).user.username}",
                        // ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextField(
                            enabled: editing,
                            controller: this.usernameController,
                            cursorColor: Theme.of(context).cursorColor,
                            decoration: InputDecoration(
                              hintText:
                                  "${(state as UserLoggedIn).user.username}",
                              // labelText: ' Username ',
                              // labelStyle: TextStyle(
                              //   color: Theme.of(context).primaryColorLight,
                              // ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColorLight),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              this.editing = !this.editing;
                              this.buttonColor = this.editing
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey;
                            });
                            if (!this.editing &&
                                usernameController.text.length > 5 &&
                                usernameController.text !=
                                    (state as UserLoggedIn).user.username) {
                              BlocProvider.of<UserBloc>(context)
                                  .changeUsername(usernameController.text);
                            }
                          },
                          icon: Icon(
                            this.editing ? Icons.check : Icons.edit,
                            color: buttonColor,
                          ),
                        ),
                      ],
                    ),
                    Text("Email    : ${(state as UserLoggedIn).user.email}"),
                    Text(
                      "ID : ${(state as UserLoggedIn).user.id}",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
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
