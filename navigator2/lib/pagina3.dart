import 'package:flutter/material.dart';

void main() => runApp(const Pagina3());

class Pagina3 extends StatelessWidget {
  const Pagina3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Esta es la Pagina 3')),
        body: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('regresar a pagina 1'),
        ),
      ),
    );
  }
}
