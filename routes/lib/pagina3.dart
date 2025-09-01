import 'package:flutter/material.dart';

void main() => runApp(const Pagina3());

class Pagina3 extends StatelessWidget {
  const Pagina3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Material App Bar')),
        body: Column(
          children: [
            const Center(child: Text('pagina 3')),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('ir a Pagina 2'),
            ),
          ],
        ),
      ),
    );
  }
}
