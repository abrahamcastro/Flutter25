import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: Inicio());
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material App Bar')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            mensaje(context, 'hola', 'Saludos');
          },
          child: Container(height: 100, color: Colors.amber, width: 100),
        ),
      ),
    );
  }

  void mensaje(BuildContext context, String s, String t) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(s),
          content: Text(t),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
