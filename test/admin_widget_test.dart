// import 'package:bloc_test/bloc_test.dart';
// import 'package:maidlink/libs.dart';

// import "package:flutter_test/flutter_test.dart";
// import 'package:mocktail/mocktail.dart';

// void main() {
//   group("  Testing Login Widget", () {
//     setUpAll(() {
//       registerFallbackValue(AuthenticationFakeState());
//       registerFallbackValue(MockLoginBloc());
//     });

//     testWidgets(" Test Auth Login ", (WidgetTester tester) async {
//       final mockUserBloc = MockLoginBloc();
//       when(() => mockUserBloc.state).thenReturn(
//         UserInit(),
//       );
//       final authScreen = Login(
//         gotoRegistration: () {},
//       );
//       final containerFinder1 = find.byType(ClipRRect);
//       await tester.pumpWidget(new MaterialApp(home: authScreen));
//       await tester.pumpAndSettle();

//       expect(containerFinder1, findsNothing);
//     }, skip: false);
//   });
// }
