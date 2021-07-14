import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../componentes/item_montadora.dart';
import '../mockdata/montadoras.dart';
import 'package:navegacao_roteiro/providers/montadoras.dart';

class TelaMontadora extends StatefulWidget {
  @override
  _TelaMontadoraState createState() => _TelaMontadoraState();
}

class _TelaMontadoraState extends State<TelaMontadora> {
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    Provider.of<MontadorasProvider>(context, listen: false)
        .buscaMontadoras()
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final montadoras = Provider.of<MontadorasProvider>(context).getMontadoras;
    return GridView(
      padding: EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, //cada elemento no máximo com 200
        childAspectRatio: 1.5, //proporção de cada elemento no gridView
        crossAxisSpacing: 20, //colocando um espaçamento cruzado de tamanho 20
        mainAxisSpacing: 20, //margin entre os componentes
      ), //criar elemento com scrrol delegando como será renderizando, aqui estendedo aos eixos
      children: montadoras.map((e) {
        return ItemMontadora(e);
      }).toList(),
    );
  }
}
