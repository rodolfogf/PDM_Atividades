import 'package:flutter/material.dart';
import 'package:navegacao_roteiro/providers/veiculos.dart';
import 'package:navegacao_roteiro/utils/rotas.dart';
import 'package:provider/provider.dart';

import '../models/montadora.dart';
import '../componentes/item_veiculo.dart';

class TelaVeiculos extends StatefulWidget {
  @override
  _TelaVeiculosState createState() => _TelaVeiculosState();
}

class _TelaVeiculosState extends State<TelaVeiculos> {
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    Provider.of<VeiculosProvider>(context, listen: false)
        .buscaVeiculos()
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var veiculos = [];
    final montadora = ModalRoute.of(context).settings.arguments as Montadora;
    final veiculosFiltro = Provider.of<VeiculosProvider>(context).getVeiculos;
    veiculosFiltro
        .map((e) => {
              if (e.id_montadora == montadora.id) {veiculos.add(e)}
            })
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(montadora.nome),
          backgroundColor: Color(int.parse('0x${montadora.color}')),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              color: Colors.lightGreen
              onPressed: () {
                Navigator.of(context).pushNamed(
                  Rotas.FORM_VEICULOS,
                  arguments: montadora.id,
                );
              },
            )
          ],
        ),
        body: ListView.builder(
            itemCount: veiculos.length,
            itemBuilder: (ctx, index) {
              return ItemVeiculo(veiculos[index]);
            }));
  }
}
