import '../../libs.dart';

class AdminAdminRegisterScreen extends StatefulWidget {
  static const String Route = "/admin_admins_registration";
  const AdminAdminRegisterScreen({Key? key}) : super(key: key);

  @override
  _AdminAdminRegisterScreenState createState() =>
      _AdminAdminRegisterScreenState();
}

class _AdminAdminRegisterScreenState extends State<AdminAdminRegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String message = "";
  Color messageColor = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          " Admin Registration ",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Container(
                // height: 100,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                width: 100,
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: BlocBuilder<AdminMaidsBloc, AdminMaidsState>(
                  builder: (context, state) {
                    if (state is AdminMaidsLoadSuccess) {
                      return Column(
                        children: [
                          Center(
                            child: Text(
                              message,
                              style: TextStyle(
                                color: messageColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextField(
                            controller: this.usernameController,
                            keyboardType: TextInputType.text,
                            cursorColor: Theme.of(context).cursorColor,
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              labelStyle: TextStyle(
                                color: Theme.of(context).primaryColorLight,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColorLight),
                              ),
                            ),
                          ),
                          TextField(
                            controller: this.emailController,
                            maxLines: 4,
                            minLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Theme.of(context).cursorColor,
                            decoration: InputDecoration(
                              labelText: ' Email',
                              labelStyle: TextStyle(
                                color: Theme.of(context).primaryColorLight,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColorLight),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                message = "...";
                                messageColor = Colors.green;
                              });
                              await Future.delayed(Duration(seconds: 1));
                              if (usernameController.text == "" &&
                                  emailController.text == "") {
                                setState(() {
                                  message = "Please fill fields";
                                  messageColor = Colors.red;
                                });
                                return;
                              }
                              if (emailController.text == "") {
                                setState(() {
                                  message = "Please fill email correctly";
                                  messageColor = Colors.red;
                                });
                                return;
                              }
                              final success =
                                  await BlocProvider.of<AdminAdminsBloc>(
                                          context)
                                      .registerAdmin(usernameController.text,
                                          emailController.text);
                              if (success) {
                                setState(() {
                                  message = "Registered Succesfuly !";
                                  messageColor = Colors.green;
                                });
                              } else {
                                setState(() {
                                  message =
                                      "Account with this email already exist ";
                                  messageColor = Colors.red;
                                });
                              }
                            },
                            child: Text(
                              " Register ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
