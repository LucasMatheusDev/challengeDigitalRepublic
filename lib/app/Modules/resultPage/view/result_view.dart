import 'package:challenge_digital_republic/app/Modules/home/controller/result_calculator_paints.dart';
import 'package:challenge_digital_republic/app/Modules/resultPage/controller/to_page_homepage_controller.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => toHomePageController(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: const Text("Resultado do calculo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Você tem ${ResultCalculatorPaints.totalSquareMetersWall} Metros Quadrado de parede para ser pintada",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 20),
            Text(
              "O que resulta em ${ResultCalculatorPaints.totalSquareMetersWall / 5} Litros de tinta",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 20),
            const Text(
              "Temos a seguinte Sugestão : ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ResultCalculatorPaints.mapPaints.entries.map((e) {
                i++;
                const SizedBox(height: 20);
                return Text(
                  "${i > 1 ? " e " : ""}${e.value} Latas de ${e.key} L",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
