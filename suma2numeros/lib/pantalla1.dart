import 'package:flutter/material.dart';

class PaginaInicio extends StatefulWidget {
  const PaginaInicio({super.key});

  @override
  State<PaginaInicio> createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {
  final TextEditingController texto1 = TextEditingController();
  final TextEditingController texto2 = TextEditingController();
  int resultado = 0;
  int opcion = 1;
  int opcion2 = 1; // Variable para el RadioListTile
  @override
  void dispose() {
    texto1.dispose();
    texto2.dispose();
    // Asegúrate de limpiar los controladores de texto para evitar fugas de memoria
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(title: Text('Pagina de Inicio')),
      body: Column(
        children: [
          RadioListTile(
            value: 1,
            title: Text('Opción 1'),
            groupValue: opcion2,
            onChanged: (value) {
              setState(() {
                opcion2 = value as int;
              });
            },
          ),
          RadioListTile(
            value: 2,
            title: Text('Opción 2'),
            groupValue: opcion2,
            onChanged: (value) {
              setState(() {
                opcion2 = value as int;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: texto1,
              decoration: InputDecoration(
                labelText: 'Ingrese el primer número',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: texto2,
              decoration: InputDecoration(
                labelText: 'Ingrese el segundo número',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Text('Suma: $resultado'),
          Row(
            children: [
              const Text('Sumar'),
              Radio(
                value: 1,
                groupValue: opcion,
                onChanged: (value) {
                  setState(() {
                    opcion = value as int;
                  });
                },
              ),
              const Text('Restar'),
              Radio(
                value: 2,
                groupValue: opcion,
                onChanged: (value) {
                  setState(() {
                    opcion = value as int;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              sumar();
            },
            child: Text('Calcular Suma'),
          ),
        ],
      ),
    );
  }

  void sumar() {
    int num1 = int.tryParse(texto1.text) ?? 0;
    int num2 = int.tryParse(texto2.text) ?? 0;
    int suma;
    if (opcion2 == 2) {
      suma = num1 - num2;
    } else {
      suma = num1 + num2;
    }
    //print('La suma es: $suma');
    setState(() {
      resultado = suma;
    });
  }
}
