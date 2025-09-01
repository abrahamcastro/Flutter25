import 'package:flutter/material.dart';
import 'package:routes/pagina2.dart';
import 'package:routes/pagina3.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Material App',
      initialRoute: '',
      routes: {
        '/': (context) => const Pagina1(),
        '/pagina2': (context) => const Pagina2(),
        '/pagina3': (context) => const Pagina3(),
      },
    ),
  );
}

class Pagina1 extends StatelessWidget {
  const Pagina1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material App Bar')),
      body: Builder(
        builder: (context) {
          return Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pagina2');
                },
                child: const Text('ir a Pagina 2'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pagina3');
                },
                child: const Text('ir a Pagina 3'),
              ),
            ],
          );
        },
      ),
    );
  }
}
