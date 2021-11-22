import 'package:flutter_test/flutter_test.dart';
import 'package:maidlink/libs.dart';
import 'package:maidlink/main.dart';
import 'dart:convert';

void main() {
  testWidgets("rating-result-widgets", (WidgetTester tester) async {
    final json =
        """{"rates":4.5,"rated_by":["61202c884749ecd3d252843c","61202c884749ecd3d252843c","61202c884749ecd3d252843c"],"rate_count":3}""";

    final rate = RateResult.fromJson(jsonDecode(json) as Map<String, dynamic>);
    await tester.pumpWidget(
        // RatingShowOnly(
        //   rating: rate.rates,
        // ),
        MainApp());
    expect(
        find.byIcon(
          Icons.star,
        ),
        findsOneWidget);
  }, skip: false);
}
