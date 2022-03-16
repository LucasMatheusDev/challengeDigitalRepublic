import 'package:challenge_digital_republic/app/Modules/home/controller/result_calculator_paints.dart';

class ValidatorController {
  double _wallWidth = 2;
  double _wallHeight = 2;
  int _windows = 0;
  int _door = 0;

  get wallWidth => _wallWidth;

  set wallWidth(value) => _wallWidth = value ??= 0.0;

  get wallHeight => _wallHeight;

  set wallHeight(value) => _wallHeight = value ??= 0.0;

  get windows => _windows;

  set windows(value) => _windows = value ??= 0;

  get door => _door;

  set door(value) => _door = value ??= 0;

  double get squareMetersWall => wallHeight * wallWidth;

  String? hasSize() {
    final double result = squareMetersWall;
    if (result >= 1) {
      if (door > 0 && wallHeight - door < 0.30) {
        return "Esta parede tem uma porta muito grande";
      }
    } else {
      return "parede com menos de um metro quadrado";
    }
    if (result > 15) {
      return "parede com mais de 15 metro quadrados";
    }
  }

  String? hasSpaceForDoorsAndWindows() {
    const double areaWindows = (2.00 * 1.20);
    const double areaDoor = (0.80 * 1.90);
// Aqui verificamos o valor total da area de portas e janelas presente na parede
    final double totalAreaDoorAndWindows =
        ((areaDoor * door) + (areaWindows * windows));
    final double fullAreaWall = squareMetersWall;
    if (windows > 0 || door > 0) {
      if (fullAreaWall / 2 < totalAreaDoorAndWindows) {
        return "As janelas e/ou portas são muito grandes";
      }
    }
  }

  /* agrupando os validações ao invés de chamar diretamente, 
      você abre espaço para reutilização de código */
  String? allValidators() {
    String? result = hasSize();
    result ??= hasSpaceForDoorsAndWindows();
    return result;
  }
void updateInformation(){
ResultCalculatorPaints.totalSquareMetersWall += squareMetersWall;
}
  
}
