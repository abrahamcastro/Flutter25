import 'package:flutter/material.dart';

class DetallePedido extends StatelessWidget {
  final String nombre;
  final List<String> productos;

  const DetallePedido({
    super.key,
    required this.nombre,
    required this.productos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pedido de $nombre")),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(productos[index]));
        },
      ),
    );
  }
}
