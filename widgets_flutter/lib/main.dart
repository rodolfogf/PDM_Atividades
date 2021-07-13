import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

void main() => runApp(Aplicativo());

class Aplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atividade Widgets',
      home: CustomForm(),
    );
  }
}

class CustomForm extends StatefulWidget {
  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String retornaData(String signo) {
    signo = signo.toUpperCase();
    String texto = "O seu aniversário é ";
    switch (signo) {
      case "CAPRICÓRNIO":
        return texto + "de 22 de dezembro a de 20 janeiro";
      case "AQUÁRIO":
        return texto + "de 21 de janeiro a 18 de fevereiro";
      case "PEIXES":
        return texto + "de 19 de fevereiro a 20 de março";
      case "ÁRIES":
        return texto + "21 de março a 20 de abril";
      case "TOURO":
        return texto + "de 21 de abril a de 20 maio";
      case "GÊMEOS":
        return texto + " de 21 de maio a 20 de junho";
      case "CÂNCER":
        return texto + "de 21 de junho a 22 de julho";
      case "LEÃO":
        return texto + "de 23 de julho a 22 de agosto";
      case "VIRGEM":
        return texto + "de 23 de agosto a 22 de setembro";
      case "LIBRA":
        return texto + "de 23 de setembro a 22 de outubro";
      case "ESCORPIÃO":
        return texto + "de 23 de outubro a 21 de novembro";
      case "SAGITÁRIO":
        return texto + "de 22 de novembro a 21 de dezembro";
      default:
        return "Entrada inválida";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Atividade Widgets',
          style: TextStyle(fontSize: 28),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text("Digite seu signo: ", style: TextStyle(fontSize: 22)),
              TextField(
                controller: controller,
              ),
            ],
          )),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(retornaData(controller.text)),
                );
              },
            );
          },
          child: Text(
            "Verificar",
            style: TextStyle(fontSize: 22),
          )),
    );
  }
}
