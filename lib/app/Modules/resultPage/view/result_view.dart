import 'package:challenge_digital_republic/app/Modules/home/controller/result_calculator_paints.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultado do calculo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Você tem ${ResultCalculatorPaints.totalSquareMetersWall} Metros Quadrado de parede para ser pintada",
            style: const TextStyle(fontSize: 25),
          ),
          const SizedBox(height: 20),
          Text(
            "O que resulta em ${ResultCalculatorPaints.totalSquareMetersWall / 5} Litros de tinta",
            style: const TextStyle(fontSize: 25),
          ),
          const SizedBox(height: 20),
          const Text(
            "Temos as seguintes Sugestões : ",
            style: TextStyle(fontSize: 25),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ResultCalculatorPaints.mapPaints.entries.map((e) {
              i++;
              const SizedBox(height: 20);
              return Text(
                "${i > 1 ? " e " : "."}${e.value} Latas de ${e.key} L",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              );
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
