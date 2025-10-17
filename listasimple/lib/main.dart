import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

final datos = FirebaseDatabase.instance.ref();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListaEjemplo());
  }
}

class ListaEjemplo extends StatefulWidget {
  const ListaEjemplo({super.key});

  @override
  State<ListaEjemplo> createState() => _ListaEjemploState();
}

class _ListaEjemploState extends State<ListaEjemplo> {
  // Lista de Strings
  final List<String> productos = [];

  TextEditingController nombre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ejemplo ListView")),
      body: Column(
        children: [
          TextField(controller: nombre),
          ElevatedButton(
            onPressed: () {
              setState(() {
                productos.add(nombre.text);
                nombre.clear();
              });
            },
            child: const Text("Agregar"),
          ),
          ElevatedButton(
            onPressed: () {
              for (var x in productos) {
                datos.push().set({'producto': x});
              }
              productos.clear();
              setState(() {});
            },
            child: const Text("Guardar"),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: productos.length, // número de elementos
              itemBuilder: (context, index) {
                //Respetar variable context
                return ListTile(
                  leading: const Icon(Icons.label),
                  title: Text(
                    productos[index],
                  ), // muestra el string en la lista
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Tocaste: ${productos[index]}")),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
