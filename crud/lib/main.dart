import 'package:flutter/material.dart';
import 'package:navegacao_roteiro/providers/montadoras.dart';
import 'package:navegacao_roteiro/providers/veiculos.dart';
import 'package:navegacao_roteiro/telas/tela_cadastro_montadoras.dart';
import 'package:navegacao_roteiro/telas/tela_form_montadora.dart';
import 'package:navegacao_roteiro/telas/tela_form_veiculo.dart';
import 'package:navegacao_roteiro/utils/rotas.dart';
import 'package:provider/provider.dart';
import 'telas/tela_veiculos.dart';
import 'telas/tela_detalhes_veiculos.dart';
import 'telas/tela_guias.dart';
import 'telas/tela_parametros.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MontadorasProvider>(
          create: (ctx) => MontadorasProvider(),            
        ),
        ChangeNotifierProvider<VeiculosProvider>(
          create: (ctx) => VeiculosProvider(),            
        )
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.yellowAccent,
        routes: {
          Rotas.HOME: (ctx) => TelaTabulacao(),
          Rotas.VEICULOS: (ctx) => TelaVeiculos(),
          Rotas.DETALHES_VEICULOS: (ctx) => TelaDetalhes(),
          Rotas.PARAMETROS: (ctx) => TelaParametros(),
          Rotas.CAD_MONTADORAS: (ctx) => TelaCadastroMontadora(),
          Rotas.FORM_MONTADORAS: (ctx) => TelaFormMontadora(),
          Rotas.FORM_VEICULOS: (ctx) => TelaFormVeiculoState(),
        },
        onGenerateRoute: (settings) {
          print(settings.name);
          return null;
        },
        onUnknownRoute: (settings) {
          print("rota nao encontrada");
          return null;
        },
      ),
    );
  }
}
