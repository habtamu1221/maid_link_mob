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
      child: Stack(
        children: [
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black38)),
            margin: EdgeInsets.all(2),
            child: Image.network(
              StaticDataStore.URL + url,
              width: MediaQuery.of(context).size.width * 0.5,
              // height: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
          ownerID == StaticDataStore.id
              ? Positioned(
                  top: 2,
                  right: 2,
                  child: GestureDetector(
                    onTap: () {
                      // --
                      BlocProvider.of<MaidBloc>(context)
                          .add(MaidEventRemoveProfilePicture(this.url));
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
