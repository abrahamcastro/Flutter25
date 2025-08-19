import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Material App Bar')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [boton(1), boton(2), boton(3)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [boton(4), boton(5), boton(6)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [boton(7), boton(8), boton(9)],
            ),
          ],
        ),
      ),
    );
  }

  Widget boton(int i) {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Botón $i'),
                  content: Text('Has presionado el botón $i'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cerrar'),
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            margin: EdgeInsets.all(8.0),
            height: 100,
            width: 100,
            color: Colors.amber,
          ),
        );
      },
    );
  }
}
