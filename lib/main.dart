import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "libs.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      MultiBlocProvider(
        providers: [
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
            return PostsRating(MyRatingRepo(MyRatingProvider()));
          }),
          // AdminMaidsBloc
          BlocProvider(create: (contxt) {
            return AdminMaidsBloc(
                AdminMaidRepo(provider: AdminMaidsProvider()));
          }),
          BlocProvider(
            create: (contxt) {
              return AdminAdminsBloc(
                  AdminAdminRepo(provider: AdminAdminsProvider()));
            },
          ),
        ],
        child: MainApp(),
      ),
    );
  });
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
          return MyMaids(repo: MyRatingRepo(MyRatingProvider()));
        },
        EditProfileScreen.Route: (BuildContext context) {
          return EditProfileScreen();
        },
        MyWorks.Route: (BuildContext context) {
          return MyWorks();
        },
        AddWorkProfileScreen.Route: (BuildContext context) {
          return AddWorkProfileScreen();
        },
        AdminMaids.Route: (BuildContext context) {
          return AdminMaids();
        },
        AdminMaidRegisterScreen.Route: (BuildContext context) {
          return AdminMaidRegisterScreen();
        },
        AdminAdmins.Route: (BuildContext context) {
          return AdminAdmins();
        },
        AdminAdminRegisterScreen.Route: (BuildContext context) {
          return AdminAdminRegisterScreen();
        },
      },
    );
  }
}
