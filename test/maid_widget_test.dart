import 'package:bloc_test/bloc_test.dart';
import 'package:maidlink/libs.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:mocktail/mocktail.dart';

class MockMaidBloc extends MockBloc<MaidEvent, MaidBlocState>
    implements MaidBloc {}

class FakeMaidEvent extends Fake implements MaidEvent {}

class FakeMaidState extends Fake implements MaidBlocState {}

void main() {
  group("Testing Maid Widgets ", () {
    setUpAll(() {
      registerFallbackValue(FakeMaidState());
      registerFallbackValue(FakeMaidEvent());
    });

    testWidgets(" Testing Edit Maid Info Widget ", (WidgetTester tester) async {
      final mockMaidBloc = MockMaidBloc();
      when(() => mockMaidBloc.state).thenReturn(
        MaidBlocInit(),
      );
      final editMaidInfo = EditMaidInfo(
        key: Key("randomstring"),
      );
      await tester.pumpWidget(editMaidInfo);
      await tester.pumpAndSettle();
      expect(find.text(" Update "), findsOneWidget);
    });

    testWidgets(" Test Maids Picture Widget  ", (WidgetTester tester) async {
      final maidsPicture = MaidPictures(
          pictures: dummymaid.profileImages, ownerID: dummymaid!.user!.id);
      await tester.pumpWidget(maidsPicture);
      expect(find.byElementType(Container), findsOneWidget);
    });

    testWidgets(" Test Maid Profile Detail Widget ",
        (WidgetTester tester) async {
      final maidDetailProfile = MaidProfile(
        maid: dummymaid,
      );
      await tester.pumpWidget(maidDetailProfile);
      await tester.pumpAndSettle();
      expect(find.text("Address"), findsOneWidget);
      // expect(find.byElementType(Container), findsOneWidget);
    });
  });
}
