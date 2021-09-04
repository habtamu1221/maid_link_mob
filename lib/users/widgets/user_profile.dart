import '../../libs.dart';

class UserProfile extends StatelessWidget {
  final DUser? user;
  UserProfile({Key? key, this.user}) : super(key: key);

  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 1,
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
                        : user!.imageUrl != ""
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
                              ),
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
          ],
        ),
      ),
    );
  }
}
