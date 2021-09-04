import '../../libs.dart';

class ThemeBloc extends Cubit<ThemeData?> {
  int index = 0;

  static ThemeData? theme = ThemeData(
    primarySwatch: Colors.orange,
    textTheme: TextTheme(
      body1: TextStyle(
        color: Colors.black,
      ),
    ),
    canvasColor: Colors.white,
  );

  List<ThemeData> themes = [
    ThemeData(
      primarySwatch: Colors.green,
      textTheme: TextTheme(
        body1: TextStyle(
          color: Colors.black,
        ),
      ),
      canvasColor: Colors.white,
    ),
    ThemeData(
      primarySwatch: Colors.orange,
      textTheme: TextTheme(
        body1: TextStyle(
          color: Colors.black,
        ),
      ),
      canvasColor: Colors.white,
    ),
    ThemeData(
      primarySwatch: Colors.orange,
      textTheme: TextTheme(
        body1: TextStyle(
          color: Colors.black,
        ),
      ),
      canvasColor: Colors.white,
    )
  ];
  ThemeBloc() : super(theme);

  void setTheme(int index) {
    if (index >= 3) return;
    theme = themes[index];
    emit(theme);
  }
}
