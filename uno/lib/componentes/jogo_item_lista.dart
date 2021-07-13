import 'package:flutter/material.dart';
import 'package:navegacao_roteiro/models/jogo.dart';
import 'package:navegacao_roteiro/providers/jogo.dart';
import 'package:navegacao_roteiro/utils/rotas.dart';
import 'package:provider/provider.dart';

class ItemListaJogo extends StatelessWidget {
  final Jogo jogo;

  ItemListaJogo(this.jogo);

  void deleteJogo(context, Jogo jogo) {
    Provider.of<JogoProvider>(context, listen: false)
        .deleteJogos(jogo);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(15),
      tileColor: Color(int.parse('0x${jogo.cor}')),
      title: Container(
        child: Text(
          jogo.nome,
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
                  //AO CHAMAR O FORM PELO EDITAR ENVIO OS ARGUMENTOS DA JOGO
                  Navigator.of(context).pushNamed(
                    Rotas.FORM_JOGOS,
                    arguments: jogo,
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
                              deleteJogo(context, jogo);
                              Navigator.of(context).pop();
                            })
                      ],
                    ),
                  );
                },
                color: Colors.purple,
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons. ,
                onPressed: () {
                  //AO CHAMAR O FORM PELO EDITAR ENVIO OS ARGUMENTOS DA JOGO
                  Navigator.of(context).pushNamed(
                    Rotas.CAD_JOGADORES,
                    arguments: jogo,
                  );
                },
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
