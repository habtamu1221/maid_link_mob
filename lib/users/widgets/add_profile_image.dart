import '../../libs.dart';

class AddPicture extends StatefulWidget {
  const AddPicture({Key? key}) : super(key: key);

  @override
  _AddPictureState createState() => _AddPictureState();
}

class _AddPictureState extends State<AddPicture> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: GestureDetector(
        onTap: () {
          final image = pickImage(context);
          // if (image != null) {
          image.then((value) async {
            final file = File(value!.path);
            BlocProvider.of<MaidBloc>(context)
                .add(MaidEventAddProfileImage(file!));
          });
        },
        child: Container(
          height: 50,
          width: 50,
          color: Theme.of(context).primaryColor,
          child: Icon(
            Icons.add_a_photo,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
