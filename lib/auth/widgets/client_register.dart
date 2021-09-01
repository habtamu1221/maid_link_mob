import 'package:flutter/material.dart';
import 'package:maidlink/home/screens/screens.dart';

class RegisterClient extends StatelessWidget {
  RegisterClient({Key? key}) : super(key: key);
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPaswordController = TextEditingController();

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
            child: Text("Message",
                style: TextStyle(
                  color: Color(0XFFFFA726),
                  fontWeight: FontWeight.bold,
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // margin: EdgeInsets.symmetric(
                //   horizontal: 30,
                // ),
                child: TextField(
                  controller: usernameController,
                  cursorColor: Theme.of(context).cursorColor,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: ' Full Name',
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                    // suffixIcon: Icon(
                    //   Icons.check_circle,
                    // ),
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
                    // suffixIcon: Icon(
                    //   Icons.check_circle,
                    // ),
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
              Container(
                // margin: EdgeInsets.symmetric(
                //   horizontal: 30,
                // ),
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
              onPressed: () => () async {}(),
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
                Navigator.of(context).pushNamedAndRemoveUntil(
                    HomeScreen.ROUTE, (route) => false);
              }),
        ],
      ),
    );
  }
}
