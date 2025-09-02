import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> opciones = ['', '', '', '', '', '', '', '', ''];
  String opcion = 'X';
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
              children: [boton(0), boton(1), boton(2)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [boton(3), boton(4), boton(5)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [boton(6), boton(7), boton(8)],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  opciones = ['', '', '', '', '', '', '', '', ''];
                  opcion = 'X';
                });
              },
              child: Text("Reiniciar"),
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
            setState(() {
              if (opciones[i] != '') return;
              opcion = (opcion == 'X') ? 'O' : 'X';
              opciones[i] = opcion;
            });
            if (ganador(i)) {
              mensaje(context, "Ganador", "El jugador $opcion ha ganado.");
            }
            if (empate()) {
              mensaje(context, "Empate", "El juego ha terminado en empate.");
            }
          },
          child: Container(
            margin: EdgeInsets.all(8.0),
            height: 100,
            width: 100,
            color: (opciones[i] == 'X') ? Colors.blue : Colors.red,
            child: Center(
              child: Text(
                opciones[i],
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }

  void mensaje(BuildContext context, String titulo, String contenido) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(contenido),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }

  bool empate() {
    return opciones.every((e) => e != '');
  }

  bool ganador(int i) {
    final jugador = opciones[i];
    if (opciones[0] == jugador &&
        opciones[1] == jugador &&
        opciones[2] == jugador) {
      return true;
    }
    return false;
  }
}
