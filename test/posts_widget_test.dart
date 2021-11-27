import 'package:bloc_test/bloc_test.dart';
import 'package:maidlink/libs.dart';
import "dart:convert";
import "package:flutter_test/flutter_test.dart";
import 'package:mocktail/mocktail.dart';

class MockPostBloc extends MockBloc<MaidPostEvents, MaidPostState>
    implements PostBloc {}

class FakePostBlocState extends Fake implements MaidPostState {}

class FakePostBlocEvent extends Fake implements MaidPostEvents {}

class MockMaidBloc extends MockBloc<MaidEvent, MaidBlocState>
    implements MaidBloc {}

class FakeMaidEvent extends Fake implements MaidEvent {}

class FakeMaidState extends Fake implements MaidBlocState {}

void main() {
  group("Testing Posts Widgets ", () {
    setUpAll(() {
      registerFallbackValue(FakePostBlocState());
      registerFallbackValue(FakePostBlocEvent());
      registerFallbackValue(FakeMaidState());
      registerFallbackValue(FakeMaidEvent());
    });

    testWidgets("  Test Auth User Profile ", (WidgetTester tester) async {
      final payFOrmaidinfo = MaterialApp(
        home: Scaffold(
          body: PayForMaidInfo(
            maidid: dummymaid!.user!.id,
          ),
        ),
      );
      await tester.pumpWidget(
        payFOrmaidinfo,
      );

      await tester.pump();
      final findtext = find.text("Pay For Contact Info");
      final byTypeFinder = find.byElementType(AnimatedContainer);
      expect(findtext, findsOneWidget);
    }, skip: false);

    // Here I am testing a widget with a bloc in it.
    testWidgets("  Test Work Item Widget ", (WidgetTester tester) async {
      print(jsonEncode(dummyworks));
      final workItemResult = MaterialApp(
        home: Scaffold(
          body: WorksItems(works: dummyworks),
        ),
      );
      await tester.pumpWidget(
        workItemResult,
      );
      final findtext = find.text("Type");
      expect(findtext, findsOneWidget);
    }, skip: false);
  });

  testWidgets("  Test See More Button ", (WidgetTester tester) async {
    final mockPostBloc = MockPostBloc();
    when(() => mockPostBloc.state).thenReturn(
      PostInit(),
    );
    final seeMore = MaterialApp(
      home: Scaffold(
        body: SeeMore(),
      ),
    );
    await tester.pumpWidget(
      seeMore,
    );
    await tester.pumpAndSettle();
    final findtext = find.text("See More ");
    final byTypeFinder = find.byElementType(AnimatedContainer);
    expect(findtext, findsOneWidget);
  }, skip: false);

  testWidgets("  Test Work Profile Item Detail  ", (WidgetTester tester) async {
    final mockMaidBloc = MockMaidBloc();
    when(() => mockMaidBloc.state).thenReturn(
      MaidBlocInit(),
    );
    final worItemDetail = MaterialApp(
      home: Scaffold(
        body: WorkProfileItem(
          work: dummyworks[0],
        ),
      ),
    );
    await tester.pumpWidget(
      worItemDetail,
    );
    await tester.pumpAndSettle();
    final findtext = find.text("Number ");
    final byTypeFinder = find.byElementType(AnimatedContainer);
    expect(findtext, findsOneWidget);
  }, skip: false);
}
