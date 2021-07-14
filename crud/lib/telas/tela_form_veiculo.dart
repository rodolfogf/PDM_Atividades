import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navegacao_roteiro/models/montadora.dart';
import 'package:navegacao_roteiro/models/veiculos.dart';
import 'package:navegacao_roteiro/providers/veiculos.dart';
import 'package:provider/provider.dart';

import '../models/montadora.dart';

class TelaFormVeiculoState extends StatelessWidget {
  final form = GlobalKey<FormState>();
  final dadosForm = Map<String, Object>();

  void saveForm(BuildContext context, idMontadora, veiculo, type) {
    var formValido = form.currentState.validate();
    form.currentState.save();

    final novoVeiculo = Veiculos(
        id: type == 1 ? Random().nextDouble().toString() : veiculo.id,
        id_montadora:
            type == 0 ? veiculo.idMontadora.toString() : idMontadora.toString(),
        modelo: dadosForm['modelo'].toString(),
        ano: dadosForm['ano'].toString(),
        combustivel: dadosForm['combustivel'].toString(),
        valor: double.parse(dadosForm['valor']),
        imagem: dadosForm['imagem'].toString());
    print(novoVeiculo);
    if (formValido) {
      if (type == 1) {
        Provider.of<VeiculosProvider>(context, listen: false)
            .postVeiculos(novoVeiculo);
      } else {
        Provider.of<VeiculosProvider>(context, listen: false)
            .patchVeiculos(novoVeiculo);
      }
      Navigator.of(context).pushReplacementNamed('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    var idMontadora;
    var veiculo, montadora;
    var type = 0;

    if (ModalRoute.of(context).settings.arguments.runtimeType.toString() ==
        'String') {
      idMontadora = ModalRoute.of(context).settings.arguments as String;
      type = 1;
    } else {
      veiculo = ModalRoute.of(context).settings.arguments as Veiculos;
      //final montadora = ModalRoute.of(context).settings.arguments as String;
    }

    //final montadora = ModalRoute.of(context).settings.arguments as Montadora;
    return Scaffold(
        appBar: AppBar(
          title: Text("Formulário Veículos"),
          //backgroundColor: montadora.toString().,
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                type == 0
                    ? saveForm(context, idMontadora, veiculo, type)
                    : saveForm(context, idMontadora, veiculo, type);
              },
            )
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
                key: form,
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: "Modelo"),
                      textInputAction: TextInputAction.next,
                      initialValue: type == 0 ? veiculo.modelo : '',
                      onSaved: (value) {
                        dadosForm['modelo'] = value;
                      },
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return "informe um nome válido";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Ano"),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      initialValue: type == 0 ? veiculo.ano : '',
                      onSaved: (value) {
                        dadosForm['ano'] = value;
                      },
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return "informe um nome válido";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Combustível"),
                      textInputAction: TextInputAction.next,
                      initialValue: type == 0 ? veiculo.combustivel : '',
                      onSaved: (value) {
                        dadosForm['combustivel'] = value;
                      },
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return "informe um nome válido";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Valor"),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      initialValue: type == 0 ? veiculo.valor.toString() : '',
                      onSaved: (value) {
                        dadosForm['valor'] = value;
                      },
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return "informe um nome válido";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "URL Imagem"),
                      textInputAction: TextInputAction.done,
                      initialValue: type == 0 ? veiculo.imagem : '',
                      onSaved: (value) {
                        dadosForm['imagem'] = value;
                      },
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return "informe um nome válido";
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) {
                        type == 0
                            ? saveForm(context, idMontadora, veiculo, type)
                            : saveForm(context, idMontadora, veiculo, type);
                      },
                    ),
                  ],
                ))));
  }
}
