import '../../libs.dart';

class SettingScreen extends StatefulWidget {
  static const String Route = '/setting_screen';
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  TextEditingController confirmPasswordController = new TextEditingController();
  TextEditingController newPasswordController = new TextEditingController();
  TextEditingController oldPasswordController = new TextEditingController();
  TextEditingController deactivateController = new TextEditingController();
  // deactivateController
  bool showPassword = false;
  String statusMessage = "";
  Color statusColor = Colors.green;
  bool deactivateAccount = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Setting",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            ListTile(
              title: Text(
                "Deactivate Account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.dangerous,
                color: Colors.red,
              ),
              onTap: () {
                setState(() {
                  deactivateAccount = !deactivateAccount;
                });
                // activateAccount(context);
              },
            ),
            !deactivateAccount
                ? Container(
                    child: Row(
                      children: [
                        TextField(
                          controller: this.deactivateController,
                          cursorColor: Theme.of(context).cursorColor,
                          obscureText: !showPassword,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.security_rounded,
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                            ),
                            // helperText: 'example@example.com',
                            suffixIcon: GestureDetector(
                              child: Icon(
                                showPassword
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_sharp,
                                color: showPassword ? Colors.red : Colors.blue,
                              ),
                              onTap: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColorLight,
                              ),
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            ListTile(
              title: Text(
                "Change Password",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 1.5,
                  ),
                ),
                child: Column(children: [
                  Text(
                    statusMessage,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    child: TextField(
                      controller: this.oldPasswordController,
                      cursorColor: Theme.of(context).cursorColor,
                      obscureText: !showPassword,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.security_rounded,
                        ),
                        labelText: 'Old Password ',
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                        ),
                        // helperText: 'example@example.com',
                        suffixIcon: GestureDetector(
                          child: Icon(
                            showPassword
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_sharp,
                            color: showPassword ? Colors.red : Colors.blue,
                          ),
                          onTap: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: TextField(
                      controller: this.newPasswordController,
                      cursorColor: Theme.of(context).cursorColor,
                      obscureText: !showPassword,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.security_rounded,
                        ),
                        labelText: 'New Password ',
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                        ),
                        // helperText: 'example@example.com',
                        suffixIcon: GestureDetector(
                          child: Icon(
                            showPassword
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_sharp,
                            color: showPassword ? Colors.red : Colors.blue,
                          ),
                          onTap: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: TextField(
                      controller: this.confirmPasswordController,
                      cursorColor: Theme.of(context).cursorColor,
                      obscureText: !showPassword,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.security_rounded,
                        ),
                        labelText: 'Confirm Password ',
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                        ),
                        // helperText: 'example@example.com',
                        suffixIcon: GestureDetector(
                          child: Icon(
                            showPassword
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_sharp,
                            color: showPassword ? Colors.red : Colors.blue,
                          ),
                          onTap: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      setState(() {
                        this.statusMessage = "...";
                        this.statusColor = Colors.green;
                      });
                      await Future.delayed(Duration(seconds: 1));

                      if (oldPasswordController.text == "" ||
                          newPasswordController.text == "" ||
                          confirmPasswordController.text == "") {
                        setState(() {
                          this.statusMessage =
                              "Please fille all the entries correctly!";
                          this.statusColor = Colors.red;
                        });
                        return;
                      } else if (this.oldPasswordController ==
                          StaticDataStore.Password) {
                        setState(() {
                          this.statusMessage =
                              "UnAuthorized!\n Invalid Old Password";
                          this.statusColor = Colors.red;
                        });
                        return;
                      } else if (this.newPasswordController.text !=
                          this.confirmPasswordController.text) {
                        setState(() {
                          this.statusMessage = "new password mismatch";
                          this.statusColor = Colors.red;
                        });
                        return;
                      }
                      final success = await BlocProvider.of<UserBloc>(context)
                          .changePassword(newPasswordController.text,
                              confirmPasswordController.text);
                      if (success) {
                        setState(() {
                          this.statusMessage = "password changed succesfuly";
                          this.statusColor = Colors.green;
                        });
                        return;
                      } else {
                        setState(() {
                          this.statusMessage =
                              "password change failed!\nplease try again";
                          this.statusColor = Colors.red;
                        });
                      }
                      // ------
                    },
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14))),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Change Password',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: Theme.of(context).primaryColorLight,
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
