import 'package:flutter/material.dart';

class Veiculos {
  final String id;
  final String id_montadora;
  final String modelo;
  final String ano;
  final String combustivel;
  final double valor;
  final String imagem;

  const Veiculos({
    @required this.id,
    @required this.id_montadora,
    @required this.modelo,
    @required this.ano,
    @required this.combustivel,
    @required this.valor,
    @required this.imagem,
  });
}
