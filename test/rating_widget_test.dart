import 'package:flutter_test/flutter_test.dart';
import "package:flutter_test/src/widget_tester.dart";
import 'package:maidlink/libs.dart';

void main() {
  group("Testing Rating Widgets ", () {
    testWidgets("  Test Auth User Profile ", (WidgetTester tester) async {
      final rateResult = MaterialApp(
        home: Scaffold(
          body: RatingShowOnly(
            rating: 4.5,
          ),
        ),
      );
      await tester.pumpWidget(
        rateResult,
      );
      await tester.pump();
      final byKeyFinder = find.byKey(Key("ratingResult"));
      expect(byKeyFinder, findsOneWidget);
    }, skip: false);
  });
}
