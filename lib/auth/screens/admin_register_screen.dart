import '../../libs.dart';

class AdminRegistractionScreen extends StatefulWidget {
  const AdminRegistractionScreen({Key? key}) : super(key: key);

  @override
  _AdminRegistractionScreenState createState() =>
      _AdminRegistractionScreenState();
}

class _AdminRegistractionScreenState extends State<AdminRegistractionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              "Admin Registraction",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ])),
    );
  }
}
