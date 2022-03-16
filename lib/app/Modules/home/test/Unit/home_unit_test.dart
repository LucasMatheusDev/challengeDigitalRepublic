import 'package:challenge_digital_republic/app/Modules/home/controller/result_calculator_paints.dart';
import 'package:challenge_digital_republic/app/Modules/home/controller/validator_controller.dart';
import 'package:test/test.dart';

void main() {
  group("Controllers Home page", () {
    test('Accepted validations has size ', () {
      ResultCalculatorPaints().cleanValues();
      final validator = ValidatorController();

      validator.wallHeight = 2.0;
      validator.wallHeight = 2.0;
      final result = validator.hasSize();
      expect(result, null);
    });
    test('Accepted validations has Space ', () {
      ResultCalculatorPaints().cleanValues();
      final validator = ValidatorController();

      validator.wallWidth = 5.0;
      validator.wallHeight = 2.0;
      validator.door = 1;
      validator.windows = 0;
      final result = validator.hasSpaceForDoorsAndWindows();
      expect(result, null);
    });
    test('Accepted validations has space with windows', () {
      ResultCalculatorPaints().cleanValues();
      final validator = ValidatorController();

      validator.wallWidth = 5.0;
      validator.wallHeight = 2.0;
      validator.door = 0;
      validator.windows = 1;
      final result = validator.hasSpaceForDoorsAndWindows();
      expect(result, null);
    });
    test('Denied validations has size', () {
      ResultCalculatorPaints().cleanValues();
      final validator = ValidatorController();
      validator.wallWidth = 5.0;
      validator.wallHeight = 3.5;
      validator.door = 0;
      validator.windows = 1;
      final result = validator.hasSize();
      expect(result, "parede com mais de 15 metro quadrados");
    });
    test('Denied validations has size WITH door', () {
      ResultCalculatorPaints().cleanValues();
      final validator = ValidatorController();
      validator.wallWidth = 1.0;
      validator.wallHeight = 1.0;
      validator.door = 1;
      validator.windows = 0;
      final result = validator.hasSize();
      expect(result, "Esta parede tem uma porta muito grande");
    });
    test('Denied validation less than 1 square meter', () {
      ResultCalculatorPaints().cleanValues();
      final validator = ValidatorController();
      validator.wallWidth = 0.5;
      validator.wallHeight = 1.0;
      validator.door = 0;
      validator.windows = 0;
      final result = validator.hasSize();
      expect(result, "parede com menos de um metro quadrado");
    });
    test('Denied validations has Space', () {
      ResultCalculatorPaints().cleanValues();
      final validator = ValidatorController();
      validator.wallWidth = 5.0;
      validator.wallHeight = 2.0;
      validator.door = 2;
      validator.windows = 1;
      final result = validator.hasSpaceForDoorsAndWindows();
      expect(result, "As janelas e/ou portas são muito grandes");
    });
    test('update Information', () {
      ResultCalculatorPaints().cleanValues();
      final validator = ValidatorController();
      validator.wallWidth = 3.0;
      validator.wallHeight = 3.0;
      validator.door = 0;
      validator.windows = 0;
      validator.updateInformation();
      double total = ResultCalculatorPaints.totalSquareMetersWall;
      expect(validator.squareMetersWall, total);
    });
    test('result Suggestion Paint', () {
      ResultCalculatorPaints().cleanValues();
      final validator = ValidatorController();
      validator.wallWidth = 4.0;
      validator.wallHeight = 3.5;
      validator.door = 0;
      validator.windows = 0;
      validator.updateInformation();
      ResultCalculatorPaints().resultSuggestionPaint();
      Map mapSuggestion = ResultCalculatorPaints.mapPaints;
      // Map Calculado de forma manual para verificação automática
      Map<double, int> mapVerification = {2.5: 1, 0.5: 1};
      expect(mapVerification, mapSuggestion);
    });
  });
  //* DEPOIS DESSE CÓDIGO LINDO A MINHA CONTRATAÇÃO É PRATICAMENTE OBRIGATÓRIA RSRS*\\
}
