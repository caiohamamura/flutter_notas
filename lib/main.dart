import 'package:flutter/material.dart';
import 'package:notas/providers/Notas.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Aplicativo());
}

class Aplicativo extends StatelessWidget {
  const Aplicativo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Notas()),
      ],
      builder: (context, child) {
        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text('Calcula Médias IFSP'),
            ),
            body: Conteudo(),
          ),
        );
      },
    );
  }
}

class Conteudo extends StatelessWidget {
  const Conteudo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notas = Provider.of<Notas>(context);

    var label = 'Nota 1';
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/logo.png'),
          NotaWidget(label: 'Nota 1', nota: 0),
          NotaWidget(label: 'Nota 2', nota: 1),
          NotaWidget(label: 'Nota 3', nota: 2),
          NotaWidget(label: 'Nota 4', nota: 3),
          Text(
            'Sua média é ${notas.getMedia()}',
          ),
        ],
      ),
    );
  }
}

class NotaWidget extends StatelessWidget {
  const NotaWidget({
    Key? key,
    required this.label,
    required this.nota,
  }) : super(key: key);

  final String label;
  final int nota;

  @override
  Widget build(BuildContext context) {
    var notas = Provider.of<Notas>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          notas.setNota(double.tryParse(value) ?? 0, nota);
        },
      ),
    );
  }
}
