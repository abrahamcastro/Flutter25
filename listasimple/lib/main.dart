import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListaEjemplo());
  }
}

class ListaEjemplo extends StatelessWidget {
  ListaEjemplo({super.key});

  // Lista de Strings
  final List<String> items = [
    "Manzana",
    "Plátano",
    "Naranja",
    "Mango",
    "Uva",
    "Sandía",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ejemplo ListView")),
      body: ListView.builder(
        itemCount: items.length, // número de elementos
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.label),
            title: Text(items[index]), // muestra el string en la lista
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Tocaste: ${items[index]}")),
              );
            },
          );
        },
      ),
    );
  }
}
