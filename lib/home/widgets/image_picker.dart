import 'package:image_picker/image_picker.dart';
import '../../libs.dart';

Future<XFile?> pickImage(BuildContext context) async {
  XFile? image;
  await showDialog(
    context: context,
    builder: (conta) {
      return AlertDialog(
        title: Text(
          " Select Image ",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 25,
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pop(conta),
            child: Text(
              "Cancel",
              textAlign: TextAlign.justify,
              style: TextStyle(
                backgroundColor: Theme.of(context).primaryColor,
                color: Colors.white,
              ),
            ),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        contentPadding: EdgeInsets.all(20),
        titlePadding: EdgeInsets.all(10),
        content: Container(
            child: Row(
          children: [
            GestureDetector(
              child: Icon(
                Icons.camera,
                size: 80.0,
                color: Colors.white,
              ),
              onTap: () async {
                image = await ImagePicker().pickImage(
                    source: ImageSource.camera, imageQuality: 50) as XFile;
                Navigator.pop(conta);
              },
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              child: IconButton(
                icon: Icon(
                  Icons.camera_front,
                  size: 80.0,
                  color: Colors.white,
                ),
                onPressed: () async {
                  image = (await ImagePicker().pickImage(
                      source: ImageSource.gallery, imageQuality: 50)) as XFile;
                  Navigator.pop(conta);
                },
              ),
            ),
          ],
        )),
      );
    },
    barrierDismissible: true,
    useSafeArea: true,
  );
  return image;
}
