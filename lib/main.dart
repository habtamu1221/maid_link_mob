import 'package:flutter/material.dart';
import "libs.dart";

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  void gotoAuthPage(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil("/auth", (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maid Link',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.black,
          ),
        ),
        canvasColor: Colors.white,
      ),
      initialRoute: "/",
      routes: {
        "/": (BuildContext contaex1) {
          return SplashApp(
            onInitializationComplete: gotoAuthPage,
          );
        },
        "/auth": (BuildContext contaex1) {
          return RegistrationScreen();
        },
        HomeScreen.ROUTE: (BuildContext context1) {
          return HomeScreen();
        }
      },
    );
    //   },
    // );
    //  )) },
    // );
  }
}
