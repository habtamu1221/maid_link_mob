// import 'package:maidlink/users/widgets/work_item.dart';

import '../../libs.dart';

class MaidProfile extends StatelessWidget {
  final Maid maid;
  const MaidProfile({Key? key, required this.maid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTile(
            leading: Text(
              "Phone",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            title: Text("${maid.phone}"),
          ),
          ListTile(
            leading: Text(
              "Address",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            title: Text("${maid.address}"),
          ),
          ListTile(
            leading: Text(
              "Bio",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            title: Text("${maid.bio != '' ? maid.bio : ' ---- '}"),
          ),
          // SizedBox(),
          ListTile(
            leading: Text(
              "Careers",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            title: Column(
                // itemCount: maid.carrers.length,
                // itemBuilder: (context, index) {
                children: [
                  ...maid.carrers
                      .map(
                        (e) => Text("${e}"),
                      )
                      .toList(),
                ]),
          )
        ],
      ),
    );
  }
}
