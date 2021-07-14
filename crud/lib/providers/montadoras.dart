import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:navegacao_roteiro/mockdata/montadoras.dart';
import 'package:navegacao_roteiro/models/montadora.dart';
import 'package:http/http.dart' as http;
import 'package:navegacao_roteiro/utils/variaveis.dart';

class MontadorasProvider with ChangeNotifier {
  List<Montadora> _montadoras = [];

  List<Montadora> get getMontadoras => [..._montadoras];

  void adicionarMontadora(Montadora montadora) {
    _montadoras.add(montadora);
    notifyListeners();
  }

  Future<void> postMontadora(Montadora montadora) async {
    var url = Uri.https(Variaveis.BACKURL, '/montadoras.json');
    http
        .post(url,
            body: jsonEncode({
              'nome': montadora.nome,
            }))
        .then((value) {
      adicionarMontadora(montadora);
    });
  }

  Future<void> patchMontadora(Montadora montadora) async {
    var url = Uri.https(Variaveis.BACKURL, '/montadoras/${montadora.id}.json');
    http
        .patch(url,
            body: jsonEncode({
              'nome': montadora.nome,
            }))
        .then((value) {
      buscaMontadoras();
      notifyListeners();
    });
  }

  Future<void> deleteMontadora(Montadora montadora) async {
    var url = Uri.https(Variaveis.BACKURL, '/montadoras/${montadora.id}.json');
    http
        .delete(url,
            body: jsonEncode({
              'nome': montadora.nome,
            }))
        .then((value) {
      buscaMontadoras();
      notifyListeners();
    });
  }

  Future<void> buscaMontadoras() async {
    var url = Uri.https(Variaveis.BACKURL, '/montadoras.json');
    var resposta = await http.get(url);
    Map<String, dynamic> data = json.decode(resposta.body);
    _montadoras.clear();
    data.forEach((idMontadora, dadosMontadora) {
      adicionarMontadora(Montadora(
        id: idMontadora,
        nome: dadosMontadora['nome'],
        color: dadosMontadora['cor'],
      ));
    });
    notifyListeners();
  }
}
