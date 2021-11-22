import '../../libs.dart';

class MaidRegistrationScreen extends StatefulWidget {
  const MaidRegistrationScreen({Key? key}) : super(key: key);

  @override
  _MaidRegistrationScreenState createState() => _MaidRegistrationScreenState();
}

class _MaidRegistrationScreenState extends State<MaidRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maid Registration"),
      ),
    );
  }
}
