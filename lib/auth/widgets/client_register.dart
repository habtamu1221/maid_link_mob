import 'package:flutter/material.dart';
import '../../libs.dart';

class RegisterClient extends StatefulWidget {
  final Function gotoLogin;
  RegisterClient({Key? key, required this.gotoLogin}) : super(key: key);

  @override
  State<RegisterClient> createState() {
    return _RegisterClientState();
  }
}

class _RegisterClientState extends State<RegisterClient> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPaswordController = TextEditingController();
  String statusMessage = "";
  Color statusColor = Colors.green;
  bool inProgress = false;

  bool isEmail(String email) {
    final spemail = email.split("@");
    if (spemail.length > 1) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.elliptical(100, 50),
        ),
      ),
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 10,
            ),
            child: Center(
              child: const CircularProgressIndicator(color: Colors.white),
            ),
          ),
          inProgress
              ? Center(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(),
                  ),
                )
              : SizedBox(),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 5,
              // vertical: 10,
            ),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0XFFFFA726)),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Text(
              statusMessage,
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: TextField(
                  controller: usernameController,
                  cursorColor: Theme.of(context).cursorColor,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: ' Full Name',
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColorLight),
                    ),
                  ),
                ),
              ),
              Container(
                // margin: EdgeInsets.symmetric(
                //   horizontal: 30,
                // ),
                child: TextField(
                  controller: emailController,
                  cursorColor: Theme.of(context).cursorColor,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: ' Email ',
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColorLight),
                    ),
                  ),
                ),
              ),
              Container(
                // margin: EdgeInsets.symmetric(
                //   horizontal: 30,
                // ),
                child: TextField(
                  controller: passwordController,
                  cursorColor: Theme.of(context).cursorColor,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.security_rounded,
                    ),
                    labelText: ' Password ',
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColorLight,
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
                  controller: confirmPaswordController,
                  cursorColor: Theme.of(context).cursorColor,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.security_rounded,
                    ),
                    labelText: ' Confirm Password ',
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                    // helperText: 'example@example.com',
                    // suffixIcon: Icon(
                    //   Icons.check_circle,
                    // ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            constraints: const BoxConstraints(maxWidth: 500),
            child: RaisedButton(
              onPressed: () async {
                print("Register Called ");
                setState(() {
                  statusMessage = "";
                  statusColor = Colors.green;
                });
                // check whether the datas all are filled with
                if (usernameController.text == "" ||
                    emailController.text == "" ||
                    passwordController.text == "" ||
                    confirmPaswordController.text == "") {
                  setState(() {
                    statusMessage = "fill the entries";
                    statusColor = Colors.red;
                  });
                } else if (passwordController.text !=
                    confirmPaswordController.text) {
                  setState(() {
                    statusMessage = "re-type the password";
                    passwordController.text = "";
                    confirmPaswordController.text = "";
                    statusColor = Colors.red;
                  });
                } else if (!isEmail(emailController.text)) {
                  setState(() {
                    statusMessage = "Invalid Email Address ";
                    emailController.text = "";
                    statusColor = Colors.red;
                    inProgress = false;
                  });
                }
                setState(() {
                  statusMessage = " loading ... ";
                  statusColor = Colors.green;
                  inProgress = true;
                });

                await Future.delayed(Duration(seconds: 2));
                // submit teh form to the server ---
                final result =
                    await BlocProvider.of<UserBloc>(context).registerClient(
                  usernameController.text,
                  emailController.text,
                  passwordController.text,
                );
                if (result == null) {
                  setState(() {
                    statusMessage = "  INTERNAL SERVER ERROR ";
                    statusColor = Colors.red;
                    inProgress = false;
                  });
                  return;
                }
                if (result is DUser) {
                  final state = await BlocProvider.of<UserBloc>(context)
                      .loginUser(emailController.text, passwordController.text);
                  if (state is UserLoggedIn) {
                    BlocProvider.of<ThemeBloc>(context)
                        .setTheme(StaticDataStore.role.index);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        HomeScreen.ROUTE, (route) => false);
                  }
                  return;
                } else if (result is ShortError) {
                  setState(() {
                    statusMessage = " ${(result as ShortError).err} ";
                    emailController.text = "";
                    statusColor = Colors.red;
                    inProgress = false;
                  });
                  return;
                  // ----------------------------
                } else {
                  setState(() {
                    statusMessage = " INTERNAL SERVER ERROR ";
                    statusColor = Colors.red;
                    inProgress = false;
                  });
                  return;
                }
                // -----------------------------------------------
              },
              color: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14))),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Register',
                      style: TextStyle(color: Theme.of(context).primaryColor),
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
          ),
          FlatButton(
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                widget.gotoLogin();
              }),
        ],
      ),
    );
  }
}
