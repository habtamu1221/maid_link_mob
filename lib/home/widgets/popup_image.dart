import '../../libs.dart';

Future<void> showImage(BuildContext context, String image) async {
  await showDialog(
    context: context,
    builder: (conta) {
      return AlertDialog(
        elevation: 25,
        backgroundColor: Colors.black54,
        // contentPadding: EdgeInsets.all(20),
        // titlePadding: EdgeInsets.all(10),
        content: Container(
          // height: 200,
          width: double.infinity,
          child: Stack(
            children: [
              Image.network(
                StaticDataStore.URL + image,
                width: double.infinity,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    size: 36,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
    barrierDismissible: true,
    useSafeArea: true,
  );
}
