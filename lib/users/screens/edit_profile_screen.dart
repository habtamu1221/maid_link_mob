import '../../libs.dart';

class EditProfileScreen extends StatefulWidget {
  static const String Route = "/edit_profile_screen";
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Edit Profile ",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            // BlocBuilder<UserBloc, UserState>(builder: (context, state) {
            //   return EditUserInfo(user: (state as UserLoggedIn).user);
            // })
            EditMaidInfo(),
            Center(
              child: Text(
                "Edit Works",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
