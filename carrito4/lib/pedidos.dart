import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'detalle.dart';

class PedidosPage extends StatelessWidget {
  const PedidosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final datos = FirebaseDatabase.instance.ref('/');

    return Scaffold(
      appBar: AppBar(title: const Text("Pedidos en tiempo real")),
      body: StreamBuilder(
        stream: datos.onValue,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data?.snapshot.value == null) {
            return const Center(child: Text("No hay pedidos aún"));
          }

          final data = (snapshot.data!).snapshot.value as Map;
          final pedidos = data.entries.toList();

          return ListView.builder(
            itemCount: pedidos.length,
            itemBuilder: (context, index) {
              final pedidoData = pedidos[index].value as Map;

              final nombreCliente = pedidoData.keys.first;
              final productos = List<String>.from(pedidoData[nombreCliente]);

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
        },
      ),
    );
  }
}
