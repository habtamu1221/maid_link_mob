import 'package:maidlink/users/widgets/work_item.dart';

import '../../libs.dart';

class MaidProfile extends StatelessWidget {
  final Maid maid;
  const MaidProfile({Key? key, required this.maid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Text("Phone"),
            title: Text("${maid.phone}"),
          ),
          ListTile(
            leading: Text("Address"),
            title: Text("${maid.address}"),
          ),
          ListTile(
            leading: Text("Bio"),
            title: Text("${maid.bio}"),
          ),
          ListTile(
            leading: Text("Careers"),
            title: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Text("${maid.carrers[index]}");
              },
            ),
          ),
        ],
      ),
    );
  }
}
