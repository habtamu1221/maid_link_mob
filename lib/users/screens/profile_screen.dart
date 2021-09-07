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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          " Profile Screen ",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              child: MaidPictures(
                pictures: [
                  "images/posts/RrSeQ.png",
                  "images/posts/7_Tb1.png",
                  "images/posts/LLSjw.png",
                  "images/posts/oNjVE.png"
                ],
              ),
              height: MediaQuery.of(context).size.height * 0.23,
              width: 200,
            ),
            MyProfile(),
            // MaidProfile(
            //   maid: maid,
            // ),
            // WorksItems(works: works),
          ],
        ),
      ),
    );
  }
}
