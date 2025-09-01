import 'package:flutter/material.dart';

void main() => runApp(const Pagina2());

class Pagina2 extends StatelessWidget {
  const Pagina2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Material App Bar')),
        body: Column(
          children: [
            const Center(child: Text('Pagina 2')),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pagina3');
              },
              child: const Text('ir a Pagina 3'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('ir a Pagina 1'),
            ),
          ],
        ),
      ),
    );
  }
}
