import 'package:challenge_digital_republic/app/Modules/home/components/info_walls/walls_information_widget.dart';
import 'package:challenge_digital_republic/app/Modules/home/controller/to_page_result_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKeyHome = GlobalKey<FormState>();
    Rx<int> count = 0.obs;
    final TextEditingController _controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Calculando a Quantidade de tinta"),
        actions: [
          IconButton(
            onPressed: () => showAboutDialog(
              context: context,
              applicationVersion: "1.0.0",
              applicationName: "Calculator Paint",
              applicationIcon: const Icon(
                Icons.format_paint,
                color: Colors.green,
              ),
            ),
            icon: const Icon(
              Icons.info_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text(
                "Que tal economizar o seu dinheiro sabendo exatamente o quanto de tinta você precisa ? ",
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                key: const Key("inputNumberOfWalls"),
                controller: _controller,
                decoration: InputDecoration(
                  label: const Text("Quantas paredes você quer pintar ?"),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(10),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  _formKeyHome.currentState?.save();
                  if (_controller.text.isEmpty) {
                  } else {
                    count.value = int.parse(_controller.text);
                  }
                },
                child: const Text("Calcular"),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => count.value < 1
                    ? const SizedBox()
                    : Form(
                        key: _formKeyHome,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          primary: false,
                          itemCount: count.value,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return WallInformationWidget(
                              index: index + 1,
                            );
                          },
                        ),
                      ),
              ),
              const SizedBox(height: 60)
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(
        () => count.value < 1
            ? const SizedBox()
            : FloatingActionButton.extended(
                key: const Key("buttonForViewResult"),
                onPressed: () => verificationToPageResultView(_formKeyHome),
                label: const Text("Calcular Tinta"),
              ),
      ),
    );
  }
}
