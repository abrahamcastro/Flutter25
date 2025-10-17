import 'package:carrito4/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

final datos = FirebaseDatabase.instance.ref();
TextEditingController nombre = TextEditingController();
void main() => runApp(const Carrito());

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
            TextField(controller: nombre),
            ElevatedButton(
              onPressed: () {
                datos.child('/').push().set({nombre.text: productos});
                setState(() {
                  productos.clear();
                  contador.value = 0;
                });
                Navigator.pop(context);
              },
              child: const Text('Finalizar Compra'),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(productos[index]),
                    trailing: const Icon(Icons.delete, color: Colors.blue),
                    onTap: () {
                      setState(() {
                        productos.removeAt(index);
                        contador.value--;
                      });
                    },
                  );
                },
                itemCount: productos.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
