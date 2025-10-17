import 'package:flutter/material.dart';
import 'package:navigator2/main.dart';

void main() => runApp(const Pagina2());

class Pagina2 extends StatelessWidget {
  const Pagina2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Esta es la Pagina 2')),
        body: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Pagina1()),
            );
          },
          child: const Text('regresar a pagina 1'),
        ),
      ),
    );
  }
}
