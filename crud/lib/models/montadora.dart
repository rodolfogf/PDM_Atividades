import 'package:flutter/material.dart';
import 'package:navegacao_roteiro/models/veiculos.dart';

class Montadora {
  final String id;
  final String nome;
  final String color;
  final List<Veiculos> veiculos;
  const Montadora({
    @required this.id,
    @required this.nome,
    this.color = "#ff0fff",
    this.veiculos,
  });
}
