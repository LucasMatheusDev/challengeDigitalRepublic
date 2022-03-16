import 'package:challenge_digital_republic/app/Modules/home/controller/result_calculator_paints.dart';
import 'package:challenge_digital_republic/main.dart';
import 'package:get/get.dart';

void toHomePageController() {
  ResultCalculatorPaints().cleanValues();
  Get.offNamed(MyApp.home);
}
