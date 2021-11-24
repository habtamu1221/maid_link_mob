import '../../libs.dart';

enum ThemeColorEvent { Green, Orange, Blue }

class ThemeBloc extends Bloc<ThemeColorEvent, ThemeData> {
  int index = 0;

  static List<ThemeData> themes = [
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
      primarySwatch: Colors.blue,
      textTheme: TextTheme(
        body1: TextStyle(
          color: Colors.black,
        ),
      ),
      canvasColor: Colors.white,
    )
  ];
  static ThemeData theme = themes[1];
  ThemeBloc() : super(theme) {
    emit(theme);
  }

  @override
  Stream<ThemeData> mapEventToState(ThemeColorEvent event) async* {
    if (event == ThemeColorEvent.Green) {
      yield themes[0];
    } else if (event == ThemeColorEvent.Orange) {
      yield themes[1];
    } else {
      yield themes[2];
    }
  }
}
