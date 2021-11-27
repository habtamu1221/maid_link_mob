import "package:flutter_test/flutter_test.dart";
import "package:maidlink/libs.dart";

void main() {
  group(
    "Home Testing Screens  ",
    () {
      // in this Test I am Goind to test the splash Screen.
      testWidgets(
        " Test Splash Screen  ",
        (WidgetTester tester) async {
          final splashScreen = MaterialApp(
            home: SplashApp(
              onInitializationComplete: () {
                // This function is to be called when the intialization is finishd.
                // but , we are passing simple element to it.
              },
            ),
          );
          final finder = find.byType(CircularProgressIndicator);
          print(finder);
          await tester.pumpWidget(splashScreen);
          expect(finder, findsOneWidget);
        },
      );
    },
  );
}
