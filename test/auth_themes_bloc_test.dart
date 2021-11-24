import '../lib/libs.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

void main() {
  group("Testing Theme Bloc ", () {
    blocTest<ThemeBloc, ThemeData>(
      " Emit Default Theme when merely Initialized ",
      build: () => ThemeBloc(),
      expect: () => [ThemeBloc.themes[1]],
    );

    blocTest<ThemeBloc, ThemeData>(
      " Testing the Theme Bloc After changing the theme to green ",
      build: () => ThemeBloc(),
      act: (bloc) => {bloc.add(ThemeColorEvent.Green)},
      expect: () => [ThemeBloc.themes[ThemeColorEvent.Green.index]],
    );
    blocTest<ThemeBloc, ThemeData>(
        " Testing the Theme Bloc After changing the theme to Blue ",
        build: () => ThemeBloc(),
        act: (bloc) => {bloc.add(ThemeColorEvent.Blue)},
        expect: () => [ThemeBloc.themes[ThemeColorEvent.Blue.index]]);
  });
}
