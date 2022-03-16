import 'package:challenge_digital_republic/app/Modules/home/view/homepage.dart';
import 'package:challenge_digital_republic/app/Modules/resultPage/view/result_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  group('Result Page ', () {
    testWidgets('change view for page result', (WidgetTester tester) async {
      await tester.pumpWidget(const GetMaterialApp(
        home: HomePage(),
      ));
      await tester.enterText(find.byKey(const Key("inputNumberOfWalls")), "1");
      await tester.tap(find.widgetWithText(ElevatedButton, "Calcular"));
      await tester.pump();
      await tester.enterText(find.byKey(const Key("wallHeightKey")), 2.toString());
      await tester.enterText(find.byKey(const Key("wallWidthKey")), 2.toString());
      await tester.enterText(find.byKey(const Key("windowsKey")), 0.toString());
      await tester.enterText(find.byKey(const Key("doorKey")), 0.toString());
    

      await tester
          .tap(find.byKey(const Key("buttonForViewResult")));
  
      expect(find.widgetWithText(AppBar, "Resultado do calculo"), findsWidgets);
      //expect(find.byKey(const Key("resultViewKey")), findsWidgets);
    });
  });
}
