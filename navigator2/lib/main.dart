import 'package:flutter/material.dart';
import 'package:navigator2/pagina2.dart';
import 'package:navigator2/pagina3.dart';

void main() => runApp(const Pagina1());

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<Pagina1> createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Esta es la Pagina 1')),
        body: Builder(
          builder: (context) {
            return Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Pagina2()),
                    );
                  },
                  child: const Text('Ir a Pagina 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Pagina3()),
                    );
                  },
                  child: const Text('Ir a Pagina 3'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
