// import 'package:maidlink/users/widgets/work_item.dart';

import '../../libs.dart';

class MaidProfile extends StatelessWidget {
  final Maid maid;
  const MaidProfile({Key? key, required this.maid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Careers"),
          ListView.builder(
            itemCount: maid.carrers.length,
            itemBuilder: (context, index) {
              return Text("${maid.carrers[index]}");
            },
          ),
        ]),
      ],
    );
  }
}
