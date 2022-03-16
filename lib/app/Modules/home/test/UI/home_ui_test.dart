import 'package:challenge_digital_republic/app/Modules/home/components/info_walls/walls_information_widget.dart';
import 'package:challenge_digital_republic/app/Modules/home/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Home page', () {
    group('input number of walls', () {
      testWidgets('input number of walls', (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: HomePage()));
        await tester.enterText(
            find.byKey(const Key("inputNumberOfWalls")), "1");
        await tester.tap(find.widgetWithText(ElevatedButton, "Calcular"));
        await tester.pump();
        expect(find.byType(WallInformationWidget), findsOneWidget);
      });

      testWidgets('input number of  multiple walls',
          (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: HomePage()));

        await tester.enterText(
            find.byKey(const Key("inputNumberOfWalls")), "4");
        await tester.tap(find.widgetWithText(ElevatedButton, "Calcular"));
        await tester.pump();
        expect(find.byType(WallInformationWidget), findsWidgets);
      });

      group('Button result', () {
        testWidgets('search Button result', (WidgetTester tester) async {
          await tester.pumpWidget(const MaterialApp(home: HomePage()));
            await tester.enterText(
                find.byKey(const Key("inputNumberOfWalls")), "4");
            await tester.tap(find.widgetWithText(ElevatedButton, "Calcular"));
            await tester.pump();
            expect(find.byType(FloatingActionButton), findsOneWidget);
        });
      });
    });
  });
}
