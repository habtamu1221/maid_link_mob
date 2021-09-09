import '../../libs.dart';

// This page will be used only the maids ...
class EditUserInfo extends StatefulWidget {
  final DUser user;
  const EditUserInfo({Key? key, required this.user}) : super(key: key);

  @override
  _EditUserInfoState createState() => _EditUserInfoState();
}

class _EditUserInfoState extends State<EditUserInfo> {
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Row(children: [
        Text("Username "),
        TextField(
          controller: this.usernameController,
          cursorColor: Theme.of(context).cursorColor,
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            labelText: ' Username ',
            labelStyle: TextStyle(
              color: Theme.of(context).primaryColorLight,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColorLight),
            ),
          ),
        ),
      ]),
    ]));
  }
}
