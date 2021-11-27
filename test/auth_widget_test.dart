import 'package:bloc_test/bloc_test.dart';
import 'package:maidlink/libs.dart';

import "package:flutter_test/flutter_test.dart";
import 'package:mocktail/mocktail.dart';

class AuthenticationFakeState extends Fake implements UserState {}

class MockLoginBloc extends MockCubit<UserState> implements UserBloc {}

void main() {
  group("  Testing Login Widget", () {
    setUpAll(() {
      registerFallbackValue(AuthenticationFakeState());
      registerFallbackValue(MockLoginBloc());
    });

    testWidgets(" Test Auth Login ", (WidgetTester tester) async {
      final mockUserBloc = MockLoginBloc();
      when(() => mockUserBloc.state).thenReturn(
        UserInit(),
      );
      final authScreen = Login(
        gotoRegistration: () {},
      );
      final containerFinder1 = find.byType(ClipRRect);
      await tester.pumpWidget(new MaterialApp(home: authScreen));
      await tester.pumpAndSettle();

      expect(containerFinder1, findsNothing);
    }, skip: false);
  });

  // group("Auth User Profile Testing ", () {
  testWidgets("  Test Auth User Profile ", (WidgetTester tester) async {
    final userProfile = MaterialApp(
      home: Scaffold(
        body: UserProfile(
          user: dummymaid!.user,
          key: Key("sdfl;akd;"),
        ),
      ),
    );
    await tester.pumpWidget(
      userProfile,
    );
    await tester.pump();
    final containerFinder1 = find.byKey(Key("sdfl;akd;"));
    expect(containerFinder1, findsOneWidget);
  }, skip: false);

  // testWidgets("  Test Auth Edit User Info ", (WidgetTester tester) async {
  //   final userInfo =
  //       MaterialApp(
  //         home: Scaffold(
  //           body:
  //       EditUserInfo(
  //     user: dummymaid!.user!,
  //     key: Key("randomstring"),
  //       ),
  //     ),
  //   );
  //   await tester.pumpWidget(
  //     userInfo,
  //   );
  //   await tester.pump();
  //   final textfildFinder = find.text("Username ");
  //   expect(textfildFinder, findsOneWidget);
  // }, skip: false);
  // });
  testWidgets("  Test Auth Edit User Info ", (WidgetTester tester) async {
    final userInfo = MaterialApp(
      home: Scaffold(
        body: EditUserInfo(
          user: dummymaid!.user!,
          key: Key("randomstring"),
        ),
      ),
    );
    await tester.pumpWidget(
      userInfo,
    );
    await tester.pump();
    final textfildFinder = find.text("Username ");
    expect(textfildFinder, findsOneWidget);
  }, skip: false);
}
