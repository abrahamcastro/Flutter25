import 'package:borrarcarrito1/main.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Pagina2());

class Pagina2 extends StatefulWidget {
  const Pagina2({super.key});

  @override
  State<Pagina2> createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  String dato1 = datos[0];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Material App Bar')),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  dato1 = datos[1];
                });
              },
              child: Text('Ver'),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: datos.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(datos[index]));
              },
            ),
          ],
        ),
      ),
    );
  }
}
