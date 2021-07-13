import 'package:flutter/material.dart';
import 'package:navegacao_roteiro/models/jogo.dart';
import 'package:navegacao_roteiro/models/jogadores.dart';
import 'package:navegacao_roteiro/providers/jogo.dart';
import 'package:navegacao_roteiro/providers/jogadores.dart';
import 'package:navegacao_roteiro/utils/rotas.dart';
import 'package:provider/provider.dart';

class ItemListaJogador extends StatelessWidget {
  final Jogadors jogador;

  ItemListaJogador(this.jogador);

  void deleteJogador(context, Jogadors jogador) {
    Provider.of<JogadorsProvider>(context, listen: false)
        .deleteJogador(jogador);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(15),
      title: Container(
        child: Text(
          jogador.modelo,
          style: TextStyle(color: Colors.black),
        ),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  //AO CHAMAR O FORM PELO EDITAR ENVIO OS ARGUMENTOS
                  Navigator.of(context).pushNamed(
                    Rotas.FORM_JOGADORES,
                    arguments: jogador,
                  );
                },
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: IconButton(
                iconSize: 20,
                icon: Icon(Icons.delete),
                onPressed: () {
                  //VOU CRIAR UM AVISO PARA O USUÁRIO NÃO APAGAR SEM CONFIRMAR
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text("ATENÇÃO"),
                      content: Text("Está certo disso?"),
                      actions: [
                        TextButton(
                            child: Text("Não"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        TextButton(
                            child: Text("Sim"),
                            onPressed: () {
                              deleteJogador(context, jogador);
                              Navigator.of(context).pop();
                            })
                      ],
                    ),
                  );
                },
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
