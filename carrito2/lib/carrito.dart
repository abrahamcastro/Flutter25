import 'package:carrito2/main.dart';
import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';

final datos = FirebaseDatabase.instance.ref();
void main() async {
  runApp(const Carrito());
}

class Carrito extends StatefulWidget {
  const Carrito({super.key});

  @override
  State<Carrito> createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
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
                datos.child('/').push().set({'pedido': productos});
                productos.clear();
                contar.value = 0;
                Navigator.pop(context);
              },
              child: const Text('Guardar'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: productos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(productos[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          contar.value--;
                          productos.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
