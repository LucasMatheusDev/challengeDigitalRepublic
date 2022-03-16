class ResultCalculatorPaints {
  static List<double> paintSuggestion = [];
  static double totalSquareMetersWall = 0.0;
  static Map<double, int> mapPaints = {};

  void resultSuggestionPaint() {
    List<double> paintsStock = [0.5, 2.5, 3.6, 18.0];
    List<double> paints = paintsStock;
    List<double> paintSuggestion = [];
    // Convertendo para Litros
    double _areaWall = totalSquareMetersWall / 5;
    int i;
    while (_areaWall > paintsStock.first) {
      paints.add(_areaWall);
      // coloco ele na lista
      // organizo em ordem crescente
      paints.sort();
      // vejo a posição dele na lista
      i = paints.indexOf(_areaWall);
      // pego o valor anterior e subtraio por ele mesmo
      _areaWall = _areaWall - paints[i - 1];
      paintSuggestion.add(paints[i - 1]);
      paints.removeAt(i);
    }
    // se ele for o menor da lista e for mais que 0.1
    //então adicione a menor lata para complementar (no caso 0,5 L)
    if (_areaWall > 0.1) {
      paintsStock.sort();
      paintSuggestion.add(paintsStock.first);
    }
    ResultCalculatorPaints.paintSuggestion.addAll(paintSuggestion);

    // transformamos a lista de sugestão de tintas em map
    // para poder identificar as latas iguais e poder somar,
    //assim sendo : key = lata , value = quantidade de latas
    // caso a Key já exista no map, somente incrementamos o seu Value
    for (var x in paintSuggestion) {
      mapPaints[x] = !mapPaints.containsKey(x) ? 1 : (mapPaints[x]! + 1);
    }
  }

 
  void cleanValues() {
    paintSuggestion.clear();
    totalSquareMetersWall = 0.0;
    mapPaints.clear();
  }
}
