import 'package:carrito3/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final datos = FirebaseDatabase.instance.ref();

void main() => runApp(const Pagina2());

class Pagina2 extends StatefulWidget {
  const Pagina2({super.key});

  @override
  State<Pagina2> createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
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
                setState(() {
                  productos.clear();
                });
                contar.value = 0;
              },
              child: Text('Guardar'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: productos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(productos[index]),
                    trailing: const Icon(Icons.delete, color: Colors.blue),
                    onTap: () {
                      setState(() {
                        productos.removeAt(index);
                        contar.value--;
                      });
                    },
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
