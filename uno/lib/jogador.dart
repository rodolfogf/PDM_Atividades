import 'package:flutter/material.dart';
import 'package:uno/jogos.dart';

class Jogador {
  final String jogadorNome;
final String jogadorContato;
final String JogadorEmail;
final String jogadorSenha;
final List<Jogos> jogadorJogos;

const Jogador({
    @required this.jogadorNome,
    @required this.jogadorContato,
    @required this.JogadorEmail,
    @required this.jogadorSenha,
    this.jogadorJogos,
  });
}
