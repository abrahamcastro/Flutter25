import 'package:ffirebase5/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
  TextEditingController nombre = TextEditingController();
  String _resultado = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: Text('Material App Bar')),
        body: Column(
          children: [
            TextField(
              controller: nombre,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    //datos.child('nombre').set('Juan Perez');
                    if (nombre.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('El campo no puede estar vacío'),
                        ),
                      );
                      return;
                    }
                    datos.child('/').push().set({'nombre': nombre.text});
                  },
                  child: const Text('Guardar datos'),
                );
              },
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  // Leer el valor de Firebase usando la clave proporcionada
                  final snapshot = await datos.child('nombre').get();

                  if (snapshot.exists) {
                    setState(() {
                      _resultado = snapshot.value.toString();
                    });
                  } else {
                    setState(() {
                      _resultado = 'No se encontró ningún valor para la clave:';
                    });
                  }
                } catch (e) {
                  setState(() {
                    _resultado = 'Error al leer: ${e.toString()}';
                  });
                }
              },
              child: const Text('Ver datos'),
            ),
            Text(
              _resultado.isEmpty
                  ? 'No se encontró ningún valor para la clave:'
                  : 'El valor de la clave es: $_resultado',
            ),
          ],
        ),
      ),
    );
  }
}
