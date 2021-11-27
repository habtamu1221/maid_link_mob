import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import "dart:math" as math;
import '../../libs.dart';
// import "dart:async";
// import 'package:flutter/services.dart' show ByteData, rootBundle;
// import 'package:excel/excel.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen();

  static final String Route = "/register";

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static int loadingIndex = 0;
  static final Loadings = ["Loading.", "Loading..", "Loading..."];

  @override
  void initState() {}

  PageController controller = PageController();

  change() {
    if (index == 2) {
      controller.nextPage(
          duration: Duration(seconds: 2), curve: Curves.easeInCirc);
    } else if (index == 1) {
      controller.previousPage(
          duration: Duration(seconds: 2), curve: Curves.bounceInOut);
    }
  }

  void tickerFunction(Duration duration) {}
  // Declaring the Controllers
  String message = "";
  String where = "Login";
  String to = "Register";
  int index = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        // centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        key: Key("Main Container"),
        child: Column(children: [
          Expanded(
            flex: index,
            child: Container(
              padding: EdgeInsets.only(bottom: 20),
              width: double.infinity,
              // padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Theme.of(context).primaryColor, Colors.black]),
                  // color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.elliptical(100, 50),
                  )),
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                // padding: EdgeInsets.all(20),
                                child: Text(
                                  where,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              // color: Colors.black,
              width: double.infinity,
              child: PageView(
                controller: controller,
                onPageChanged: (int index) {
                  if (index == 0) {
                    setState(() {
                      this.where = "Login";
                      this.to = "Register";
                      this.index = 2;
                    });
                  } else {
                    setState(() {
                      this.where = "Register";
                      this.to = "Login";
                      this.index = 1;
                    });
                  }
                },
                children: [
                  Login(gotoRegistration: change),
                  RegisterClient(gotoLogin: change)
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

List<String> Shuffle(List<String> answers) {
  answers.shuffle(math.Random.secure());
  return (answers == null || answers.length == 0) ? [] : answers;
}
