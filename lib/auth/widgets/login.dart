import 'package:flutter/material.dart';
import '../../libs.dart';

class Login extends StatefulWidget {
  final Function gotoRegistration;

  Login({required this.gotoRegistration});

  @override
  State<Login> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String loginProgressMessage = "";
  bool showPassword = false;
  bool inProgress = false;
  Color loginProgressColor = Colors.green;
  _LoginState({Key? key});

  loginPressed(UserBloc userBlocProvider) async {
    loginProgressColor = Colors.green;
    if (emailController.text == "" && passwordController.text == "") {
      setState(() {
        this.loginProgressMessage = "please enter email and password";
        this.loginProgressColor = Colors.red;
      });

      return;
    } else if (emailController.text == "") {
      setState(() {
        this.loginProgressMessage = "please enter valid email";
        this.loginProgressColor = Colors.red;
      });

      return;
    } else if (passwordController.text == "" &&
        passwordController.text.length < 4) {
      setState(() {
        this.loginProgressMessage =
            "please enter valid password!\n length should be >= 4";
        this.loginProgressColor = Colors.red;
      });

      return;
    } else {
      setState(() {
        this.loginProgressMessage = " Loading ... ";
        this.loginProgressColor = Colors.green;
        inProgress = true;
      });
    }
    final state = await userBlocProvider.loginUser(
        emailController.text, passwordController.text);
    if (state is UserLoggedIn) {
      BlocProvider.of<ThemeBloc>(context)
          .add(ThemeColorEvent.values[(StaticDataStore.role.index) + 1]);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.ROUTE, (route) => false);
      if (StaticDataStore.role == 1) {
        BlocProvider.of<MaidBloc>(context).add(MaidEventLoad());
      }
    } else {
      setState(() {
        this.loginProgressColor = Colors.red;
        this.loginProgressMessage = "Invalid Username or password";
        this.inProgress = false;
      });
    }
  }

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
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 10,
            ),
            child: Center(
              child: inProgress
                  ? CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    )
                  : SizedBox(),
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
            child: Text(
              loginProgressMessage,
              style: TextStyle(
                color: loginProgressColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: TextField(
                  controller: this.emailController,
                  keyboardType: TextInputType.emailAddress,
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
              onPressed: () => loginPressed(userBlocProvider),
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
              onPressed: () {
                widget.gotoRegistration();
              }),
        ],
      ),
    );
  }
}
