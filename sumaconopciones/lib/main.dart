import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
int resultado = 0;
int valor = 1;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController texto1 = TextEditingController();
  final TextEditingController texto2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Material App Bar')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: texto1,
                decoration: const InputDecoration(
                  hintText: 'Escribe un número',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.,
                controller: texto2,
                decoration: const InputDecoration(
                  hintText: 'Escribe otro número',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sumar'),
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
                Text('Restar'),
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
            SizedBox(height: 30),
            Text('Resultado: $resultado'),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                calcular();
              },
              child: Text('Aplicar'),
            ),
          ],
        ),
      ),
    );
  }

  void calcular() {
    setState(() {
      int num1 = int.tryParse(texto1.text) ?? 0;
      int num2 = int.tryParse(texto2.text) ?? 0;
      if (valor == 1) {
        resultado = num1 + num2;
      } else {
        resultado = num1 - num2;
      }
    });
  }
}
