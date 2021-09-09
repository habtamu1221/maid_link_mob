import '../../libs.dart';

class EditMaidInfo extends StatefulWidget {
  const EditMaidInfo({Key? key}) : super(key: key);

  @override
  _EditMaidInfoState createState() => _EditMaidInfoState();
}

class _EditMaidInfoState extends State<EditMaidInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        child: Column(children: [Text("This is profile edit ... ")]));
  }
}
