// import '../libs.dart';
import 'package:flutter/scheduler.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

Future<void> runMainApp(BuildContext context) async {
  int groupID = 0;
  int categoryID = 0;

  // CategoryScreen(   ),
}

class SplashApp extends StatefulWidget {
  final Function onInitializationComplete;
  static const String RouteName = "/splash/";

  SplashApp({required this.onInitializationComplete});

  @override
  _SplashAppState createState() => _SplashAppState();
}

class _SplashAppState extends State<SplashApp> {
  @override
  void initState() {
    super.initState();
    // start the ticker to control the progress value
    // updateTime();
  }

  double tickerValue = 0;

  /// some thing that update a value every time the time ticks
  /// Method Name : updateTime
  void updateTime() {
    Ticker ticker;
    ticker = new Ticker((Duration duration) {
      if (duration.inSeconds >= 50) {
        // ticker.stop();
      }
      setState(() {
        this.tickerValue = duration.inSeconds * 0.02;
        print(this.tickerValue);
      });
    });
    ticker.start();
  }

  Future<void> _initializeAsyncDependencies(BuildContext context) async {
    Future.delayed(
      Duration(milliseconds: 5000),
      () => widget.onInitializationComplete(context),
    );
    return;
  }

  @override
  Widget build(BuildContext context) {
    _initializeAsyncDependencies(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        key: Key("SplashScreenContainerWithRandomKey"),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.elliptical(1000, 1000))),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border.all(width: 0, style: BorderStyle.none),
                ),
                width: MediaQuery.of(context).size.width * 1,
                child: Container(
                  margin: EdgeInsets.zero,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0, style: BorderStyle.none),
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(100, 50),
                    ),
                  ),
                  child: Stack(
                    overflow: Overflow.clip,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/images/babysitter.jpg",
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        left: MediaQuery.of(context).size.width * 0.4,
                        // right: MediaQuery.of(context).size.width * 0.3,
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
