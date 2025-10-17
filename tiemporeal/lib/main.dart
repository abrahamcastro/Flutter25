import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lista2/firebase_options.dart';

var datos = FirebaseDatabase.instance.ref();

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
  TextEditingController nom = TextEditingController();

  @override
  void dispose() {
    nom.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Material App Bar')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nom,
                decoration: InputDecoration(
                  hintText: 'Ingrese un nombre',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                datos.child('/').set({'nombre': nom.text});
              },
              child: const Text('Agregar'),
            ),
            const SizedBox(height: 20),
            // 👇 StreamBuilder escucha cambios en tiempo real
            StreamBuilder(
              stream: datos.child('nombre').onValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (!snapshot.hasData ||
                    (snapshot.data!).snapshot.value == null) {
                  return const Text('No hay nombres agregados');
                }

                final value = (snapshot.data!).snapshot.value.toString();

                return Text('Nombres agregados: $value');
              },
            ),
          ],
        ),
      ),
    );
  }
}
