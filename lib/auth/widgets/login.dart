import 'package:flutter/material.dart';
import '../../libs.dart';

class Login extends StatefulWidget {
  @override
  State createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String loginProgressMessage = "";
  bool showPassword = false;
  Color loginProgressColor = Colors.green;
  _LoginState({Key? key});

  @override
  Widget build(BuildContext context) {
    final userBlocProvider = BlocProvider.of<UserBloc>(context);
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.elliptical(100, 50),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 10,
            ),
            child: Center(
              child: const CircularProgressIndicator(color: Colors.white),
            ),
          ),
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
            child: Text(loginProgressMessage,
                style: TextStyle(
                  color: loginProgressColor,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: TextField(
                  controller: this.emailController,
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
                child: TextField(
                  controller: this.passwordController,
                  cursorColor: Theme.of(context).cursorColor,
                  obscureText: !showPassword,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.security_rounded,
                    ),
                    labelText: ' Password ',
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
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            constraints: const BoxConstraints(maxWidth: 500),
            child: RaisedButton(
              onPressed: () async {
                if (emailController.text == "" &&
                    passwordController.text == "") {
                  setState() {
                    loginProgressMessage = "please enter email and password";
                    loginProgressColor = Colors.red;
                  }

                  return;
                } else if (emailController.text == "") {
                  setState() {
                    loginProgressMessage = "please enter valid email";
                    loginProgressColor = Colors.red;
                  }

                  return;
                } else if (passwordController.text == "" &&
                    passwordController.text.length < 4) {
                  setState() {
                    loginProgressMessage =
                        "please enter valid password!\n length should be >= 4";
                    loginProgressColor = Colors.red;
                  }

                  return;
                }
                // print("LOOOOOGGGGIIIINNNGGG ");

                setState() {
                  loginProgressMessage = "Loading ... ";
                  loginProgressColor = Colors.green;
                }

                final state = await userBlocProvider.loginUser(
                    emailController.text, passwordController.text);
                if (state is UserLoggedIn) {
                  BlocProvider.of<ThemeBloc>(context)
                      .setTheme(StaticDataStore.role.index);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      HomeScreen.ROUTE, (route) => false);
                }
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
                      'Login',
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
                "Register",
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {}),
        ],
      ),
    );
  }
}
