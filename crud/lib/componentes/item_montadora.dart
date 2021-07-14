import 'package:flutter/material.dart';
import 'package:navegacao_roteiro/utils/rotas.dart';

import '../models/montadora.dart';

import '../telas/tela_veiculos.dart';

class ItemMontadora extends StatelessWidget {
  final Montadora montadora;
  const ItemMontadora(this.montadora);

  void _selecinarVeiculo(BuildContext context) {
    Navigator.of(context).pushNamed(
      Rotas.VEICULOS,
      arguments: montadora,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selecinarVeiculo(context);
      },
      splashColor: Colors.lightGreen,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(montadora.nome),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
              Color(int.parse('0x${montadora.color}')).withOpacity(0.75),
              Color(int.parse('0xffffffff')),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      ),
    );
  }
}
