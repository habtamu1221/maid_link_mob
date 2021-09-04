import '../../libs.dart';

class ImageItem extends StatelessWidget {
  final String ownerID;
  final String url;
  ImageItem({
    Key? key,
    required this.ownerID,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Image.network(
          StaticDataStore.URL + url,
          width: MediaQuery.of(context).size.width * 0.95,
          // height: MediaQuery.of(context).size.width * 0.3,
        ),
      ),
    );
  }
}
