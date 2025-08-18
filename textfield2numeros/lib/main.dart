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
  final TextEditingController t1 = TextEditingController();
  final TextEditingController t2 = TextEditingController();
  int valor = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material App Bar')),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: t1,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ingrese un número',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: t2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ingrese un número',
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Suma'),
                Radio(
                  value: 1,
                  groupValue: valor,
                  onChanged: (v) {
                    setState(() {
                      valor = v as int;
                    });
                  },
                  activeColor: Colors.blue,
                ),
                Text('Resta'),
                Radio(
                  value: 2,
                  groupValue: valor,
                  onChanged: (v) {
                    setState(() {
                      valor = v as int;
                    });
                  },
                  activeColor: Colors.blue,
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calcular();
              },
              child: const Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }

  void calcular() {
    int num1 = int.tryParse(t1.text) ?? 0;
    int num2 = int.tryParse(t2.text) ?? 0;
    int resultado = 0;
    if (valor == 2) {
      // Resta
      resultado = num1 - num2;
    } else {
      // Suma
      resultado = num1 + num2;
    }

    mensaje(resultado);
  }

  void mensaje(int resultado) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resultado'),
          content: Text('El resultado es: $resultado'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
