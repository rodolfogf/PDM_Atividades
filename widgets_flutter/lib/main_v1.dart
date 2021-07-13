void main() => runApp(AtividadeWidgets());

class AtividadeWidgets extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AtividadeWidgets> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Atividade Widgets",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Text(
                "Digite o seu signo: ",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue[600],
                    fontWeight: FontWeight.bold),
              ),
              TextField(),
              //ElevatedButton(onPressed: () {}, child: Text("Verificar"))
            ],
          ),
        ),
      ),
    );
  }
}
