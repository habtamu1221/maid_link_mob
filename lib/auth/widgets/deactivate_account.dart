import 'package:image_picker/image_picker.dart';
import '../../libs.dart';

Future<void> activateAccount(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (conta) {
      return AlertDialog(
        title: Text(
          " Alert !",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 12,
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
          FlatButton(
            onPressed: () async {
              final success =
                  await BlocProvider.of<UserBloc>(context).deactivate();
              if (success) {
                Navigator.pop(conta);
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AuthScreen.Route, (route) => false);
                StaticDataStore.TOKEN = "";
                StaticDataStore.role = Role.admin;
                BlocProvider.of<ThemeBloc>(context)
                    .add(ThemeColorEvent.values[1]);
                context.watch<UserBloc>().setState(UserInit());
                return;
              } else {
                print("WAS Not SUccesful...");
                Navigator.pop(conta);
              }
            },
            child: Text(
              "Yes",
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
        content: Text(
          " Are you sure to deactivate the account ? ",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    },
    barrierDismissible: true,
    useSafeArea: true,
  );
}
