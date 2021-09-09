import 'package:flutter/material.dart';
import "libs.dart";

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => UserBloc(
        UserRepo(
          UserProvider(),
        ),
      ),
    ),
    //
    BlocProvider(
      create: (contet) {
        return ThemeBloc();
      },
    ),
    BlocProvider(
      create: (contet) {
        return PostBloc(repo: MaidPostRepo(provider: MaidPostProvider()));
      },
    ),
    BlocProvider(
      create: (contet) {
        return MaidBloc(repo: MaidRepo(provider: MaidProvider()));
      },
    ),
    BlocProvider(create: (contxt) {
      return MyMaidsBloc(MyMaidsRepo(MyMaidsProvider()));
    })
  ], child: MainApp()));
}

class MainApp extends StatelessWidget {
  void gotoAuthPage(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AuthScreen.Route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maid Link',
      theme: context.watch<ThemeBloc>().state,
      initialRoute: "/",
      routes: {
        "/": (BuildContext contaex1) {
          return SplashApp(
            onInitializationComplete: gotoAuthPage,
          );
        },
        AuthScreen.Route: (BuildContext contaex1) {
          return AuthScreen();
        },
        HomeScreen.ROUTE: (BuildContext context1) {
          return HomeScreen();
        },
        AdminsScreen.Route: (BuildContext context) {
          return AdminsScreen();
        },
        ProfileScreen.Route: (BuildContext context) {
          return ProfileScreen();
        },
        SettingScreen.Route: (BuildContext context) {
          return SettingScreen();
        },
        MaidProfileScreen.Route: (BuildContext context) {
          return MaidProfileScreen();
        },
        MyMaids.Route: (BuildContext context) {
          return MyMaids(repo: MyMaidsRepo(MyMaidsProvider()));
        },
        EditProfileScreen.Route: (BuildContext context) {
          return EditProfileScreen();
        }
      },
    );
    //   },
    // );
    //  )) },
    // );
  }
}
