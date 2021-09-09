import '../../libs.dart';

class UserProfile extends StatelessWidget {
  final DUser? user;
  UserProfile({Key? key, required this.user}) : super(key: key);

  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        child: Row(children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                // final image = pickImage(context);
                // if (image != null) {
                //   image.then((value) {
                //     setState(() {
                //       imageFile = File(value!.path);
                //     });
                //   });
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
                            : (user!.imageUrl != ""
                                ? Image.network(
                                    StaticDataStore.URL + user!.imageUrl,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    "assets/images/avatar.png",
                                    width: 100,
                                    height: 100,
                                  )),
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
                  "ID          : ${user!.id}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Username : ${user!.username}"),
                Text("Email    : ${user!.email}"),

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
                    StaticDataStore.roles[user!.role],
                    style: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
