import 'package:flutter/material.dart';
import 'package:navegacao_roteiro/models/montadora.dart';
import 'package:navegacao_roteiro/providers/veiculos.dart';
import 'package:navegacao_roteiro/utils/rotas.dart';
import 'package:provider/provider.dart';
import '../models/veiculos.dart';
import '../models/montadora.dart';

class TelaDetalhes extends StatelessWidget {
  void deleteVeiculo(context, veiculo) {
    Provider.of<VeiculosProvider>(context, listen: false)
        .deleteVeiculo(veiculo);
  }

  @override
  Widget build(BuildContext context) {
    final veiculo = ModalRoute.of(context).settings.arguments as Veiculos;
    return Scaffold(
        appBar: AppBar(
          title: Text("Detalhes do Veículo: ${veiculo.modelo}"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(veiculo.imagem, fit: BoxFit.cover),
            ),
            Center(
              child: Text(
                veiculo.modelo,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              child: Text("Valor: ${veiculo.valor}"),
            ),
            Card(
              child: Text("Ano ${veiculo.ano}"),
            ),
            Card(
              child: Text("Combustível: ${veiculo.combustivel}"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      Rotas.FORM_VEICULOS,
                      arguments: veiculo,
                    );
                  },
                  color: Colors.black,
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                              title: Text("ATENÇÃO"),
                              content: Text(
                                  "Confirma exclusão do veículo ${veiculo.modelo}? Essa ação será irreversível."),
                              actions: [
                                TextButton(
                                  child: Text("Não"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text("Sim"),
                                  onPressed: () {
                                    deleteVeiculo(context, veiculo);
                                    Navigator.of(context)
                                        .pushReplacementNamed('/');
                                  },
                                )
                              ],
                            ));
                  },
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ));
  }
}
