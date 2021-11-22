import '../../libs.dart';

class MaidPictures extends StatelessWidget {
  List<String> pictures;
  String ownerID;
  MaidPictures({Key? key, required this.pictures, required this.ownerID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black38,
          ),
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (contex, index) {
            return ImageItem(
              ownerID: ownerID,
              url: pictures[index],
            );
          },
          itemCount: pictures.length,
        ),
      ),
    );
  }
}
