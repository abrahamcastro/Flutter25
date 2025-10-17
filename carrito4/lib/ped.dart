import 'package:carrito4/detalle.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Pedidos2());

final datos = FirebaseDatabase.instance.ref('/');

class Pedidos2 extends StatelessWidget {
  const Pedidos2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Material App Bar')),
        body: StreamBuilder(
          stream: datos.onValue,
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                !snapshot.hasError &&
                snapshot.data!.snapshot.value != null) {
              final lista = (snapshot.data!).snapshot.value as Map;
              final pedidos = lista.entries.toList();

              return ListView.builder(
                itemCount: pedidos.length,
                itemBuilder: (context, index) {
                  final pedidoData = pedidos[index].value as Map;

                  final nombreCliente = pedidoData.keys.first;
                  final productos = List<String>.from(
                    pedidoData[nombreCliente],
                  );

                  return ListTile(
                    title: Text("Pedido de $nombreCliente"),
                    subtitle: Text("Productos: ${productos.length}"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DetallePedido(
                                nombre: nombreCliente,
                                productos: productos,
                              ),
                        ),
                      );
                    },
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
