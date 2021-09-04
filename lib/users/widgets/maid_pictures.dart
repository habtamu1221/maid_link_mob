import '../../libs.dart';

class MaidPictures extends StatelessWidget {
  List<String> pictures = [
    "images/posts/RrSeQ.png",
    "images/posts/7_Tb1.png",
    "images/posts/LLSjw.png",
    "images/posts/oNjVE.png"
  ];
  MaidPictures({Key? key, required this.pictures}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
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
              ownerID: "6125f135e831b1715dcb7056",
              url: pictures[index],
            );
          },
          itemCount: pictures.length,
        ),
      ),
    );
  }
}
