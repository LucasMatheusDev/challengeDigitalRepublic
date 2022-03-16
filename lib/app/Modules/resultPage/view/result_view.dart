import 'package:challenge_digital_republic/app/Modules/home/controller/result_calculator_paints.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultado do calculo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              "Você tem ${ResultCalculatorPaints.totalSquareMetersWall} Metros Quadrado de parede para ser pintada"),
          const SizedBox(height: 20),
          const Text("Temos as seguintes Sugestões : "),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ResultCalculatorPaints.mapPaints.entries.map((e) {
              const SizedBox(height: 20);

              return Text("${e.value} Latas de ${e.key} L, ");
            }).toList(),
          ),
          const SizedBox(height: 20),
          const Text(
            "E já adiantamos as coisas para você, so clicar que o seu carrinho de compras esta pronto :)",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
