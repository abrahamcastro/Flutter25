import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final datos = FirebaseDatabase.instance.ref();

Future<void> main() async {
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
  TextEditingController nombre = TextEditingController();
  TextEditingController apellidos = TextEditingController();

  @override
  void dispose() {
    nombre.dispose();
    apellidos.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
          actions: <Widget>[
            PopupMenuButton<String>(
              color: Colors.white,
              onSelected: (value) {},
              itemBuilder:
                  (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(child: Text('Opción 1')),
                    const PopupMenuItem<String>(child: Text('Opción 2')),
                  ],
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nombre,
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: apellidos,
                decoration: const InputDecoration(labelText: 'Apellidos'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                datos.push().set({
                  'nombre': nombre.text,
                  'apellidos': apellidos.text,
                });
                nombre.clear();
                apellidos.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Dato guardado en Firebase')),
                );
              },
              child: const Text('Guardar'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
