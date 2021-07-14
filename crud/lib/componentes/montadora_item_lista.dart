import 'package:flutter/material.dart';
import 'package:navegacao_roteiro/models/montadora.dart';
import 'package:navegacao_roteiro/providers/montadoras.dart';
import 'package:navegacao_roteiro/utils/rotas.dart';
import 'package:provider/provider.dart';

class ItemListaMontadora extends StatelessWidget {
  final Montadora montadora;
  ItemListaMontadora(this.montadora);

  void deleteMontadora(context, Montadora montadora) {
    Provider.of<MontadorasProvider>(context, listen: false)
        .deleteMontadora(montadora);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Color(int.parse('0x${montadora.color}')),
      title: Container(
        child: Text(
          montadora.nome,
          style: TextStyle(color: Colors.black87),
        ),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                print("Editar");
                Navigator.of(context)
                    .pushNamed(Rotas.FORM_MONTADORAS, arguments: montadora);
              },
              color: Colors.grey[700],
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                print("Apagar");
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: Text("ATENÇÃO"),
                          content: Text(
                              "Confirmar a exclusão da montadora ${montadora.nome} e seus veículos?."),
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
                                deleteMontadora(context, montadora);
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ));
              },
              color: Colors.white38,
            ),
          ],
        ),
      ),
    );
  }
}
