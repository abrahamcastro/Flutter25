import 'package:borrarcarrito1/pagina2.dart';
import 'package:flutter/material.dart';

List<String> datos = ['Elemento 1', 'Elemento 2', 'Elemento 3'];
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
        appBar: AppBar(title: const Text('Material App Bar')),
        body: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) => const Pagina2(),
                );
                Navigator.push(context, route);
              },
              icon: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
