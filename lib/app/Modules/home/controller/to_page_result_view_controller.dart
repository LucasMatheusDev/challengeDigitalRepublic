import 'package:challenge_digital_republic/app/Modules/home/controller/result_calculator_paints.dart';
import 'package:challenge_digital_republic/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

void verificationToPageResultView(GlobalKey<FormState> _formKeyHome) {
  if (_formKeyHome.currentState!.validate()) {
    _formKeyHome.currentState?.save();
    ResultCalculatorPaints().resultSuggestionPaint();
    Get.offNamed(
      MyApp.result,
    );
  }
}
