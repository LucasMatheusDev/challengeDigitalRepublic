import 'package:challenge_digital_republic/app/Modules/home/controller/validator_controller.dart';
import 'package:flutter/material.dart';

class WallInformationWidget extends StatefulWidget {
  final int index;
  const WallInformationWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<WallInformationWidget> createState() => _WallInformationWidgetState();
}

class _WallInformationWidgetState extends State<WallInformationWidget> {
  final ValidatorController validator = ValidatorController();
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      elevation: 30,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Parede ${widget.index}",
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextFormField(
                                        enabled: true,

                     key: const Key("wallHeightKey"),
                      keyboardType: TextInputType.number,
                      decoration: customInputDecoration("altura"),
                      onChanged: (value) =>
                          validator.wallHeight = double.tryParse(value),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo vazio";
                        }
                      }),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    enabled: true,
                    key: const Key("wallWidthKey"),
                      keyboardType: TextInputType.number,
                      decoration: customInputDecoration("Largura"),
                     
                      onChanged: (value) =>
                          validator.wallWidth = double.tryParse(value),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo vazio";
                        }
                      }),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Complementos",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextFormField(
                                        enabled: true,

                     key: const Key("windowsKey"),
                    keyboardType: TextInputType.number,
                    decoration: customInputDecoration("Quantas Janelas tem ?"),
                    onChanged: (value) => validator.windows = int.tryParse(value),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo vazio";
                      }
                     
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                     key: const Key("doorKey"),
                    keyboardType: TextInputType.number,
                    decoration: customInputDecoration("Quantas Portas tem ?"),
                    onChanged: (value) => validator.door = int.tryParse(value),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo vazio";
                      }
                     
                    },
                  ),
                ),
              ],
            ),
            TextFormField(
              expands: false,
              readOnly: true,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      style: BorderStyle.none, width: 0, color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      style: BorderStyle.none, width: 0, color: Colors.black),
                ),
              ),
              validator: (value) {
                String? result = validator.allValidators();
                return result;
              },
              // Chamamos a função que ira fazer a soma e 
              //entregar o resultado ao Controller responsável 
             onSaved: (value)=> validator.updateInformation(),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

InputDecoration customInputDecoration(String label) {
  return InputDecoration(
    enabled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.blue),
    ),
    label: Text(label),
  );
}
