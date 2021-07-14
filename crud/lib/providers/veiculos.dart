import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:navegacao_roteiro/models/montadora.dart';
import 'package:navegacao_roteiro/models/veiculos.dart';
import 'package:navegacao_roteiro/utils/variaveis.dart';

class VeiculosProvider with ChangeNotifier {
  List<Montadora> _montadoras = [];
  List<Veiculos> _veiculos = [];

  List<Veiculos> get getVeiculos => [..._veiculos];

  Future<void> postVeiculos(Veiculos veiculo) async {
    var url = Uri.https(
        Variaveis.BACKURL, '/montadoras/${veiculo.id_montadora}/veiculos.json');
    http
        .post(url,
            body: jsonEncode({
              'modelo': veiculo.modelo,
              'ano': veiculo.ano,
              'combustivel': veiculo.combustivel,
              'valor': double.parse(veiculo.valor.toString()),
              'imagem': veiculo.imagem
            }))
        .then((value) {
      adicionarVeiculo(veiculo);
    });
  }

  Future<void> patchVeiculos(Veiculos veiculo) async {
    var url = Uri.https(Variaveis.BACKURL,
        '/montadoras/${veiculo.id_montadora}/veiculos/${veiculo.id}.json');
    http
        .patch(url,
            body: jsonEncode({
              'modelo': veiculo.modelo,
              'ano': veiculo.ano,
              'combustivel': veiculo.combustivel,
              'valor': double.parse(veiculo.valor.toString()),
              'imagem': veiculo.imagem
            }))
        .then((value) {
      adicionarVeiculo(veiculo);
    });
  }

  Future<void> deleteVeiculo(Veiculos veiculo) async {
    var url = Uri.https(Variaveis.BACKURL,
        '/montadoras/${veiculo.id_montadora}/veiculos/${veiculo.id}.json');
    http
        .delete(url,
            body: jsonEncode({
              'modelo': veiculo.modelo,
              'ano': veiculo.ano,
              'combustivel': veiculo.combustivel,
              'valor': double.parse(veiculo.valor.toString()),
              'imagem': veiculo.imagem
            }))
        .then((value) {
      notifyListeners();
    });
  }

  void adicionarVeiculo(Veiculos veiculo) {
    _veiculos.add(veiculo);
    notifyListeners();
  }

  Future<void> buscaVeiculos() async {
    var url = Uri.https(Variaveis.BACKURL, '/montadoras.json');
    var resposta = await http.get(url);
    Map<String, dynamic> data = json.decode(resposta.body);
    _montadoras.clear();
    _veiculos.clear();
    data.forEach((idMontadora, dadosMontadora) {
      Map<String, dynamic> dadosVeiculo = dadosMontadora['veiculos'];
      dadosVeiculo.forEach((idVeiculo, veiculo) {
        adicionarVeiculo(Veiculos(
            id: idVeiculo,
            id_montadora: idMontadora,
            modelo: veiculo['modelo'],
            ano: veiculo['ano'],
            combustivel: veiculo['combustivel'],
            valor: veiculo['valor'],
            imagem: veiculo['imagem']));
      });
    });
    notifyListeners();
  }
}
