import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final datos = FirebaseDatabase.instance.ref();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> nombres = [];
  TextEditingController nombreController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Material App Bar')),
        body: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  nombres.add(nombreController.text);
                  nombreController.clear();
                });
              },
              child: Text('Agregar'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // 👇 Guarda todos los nombres en Firebase
                for (var nombre in nombres) {
                  await datos.child("nombres").push().set({"nombre": nombre});
                }

                // Opcional: limpiar la lista después de subirlos
                setState(() {
                  nombres.clear();
                });
              },
              child: Text('Todos'),
            ),
            ListView.separated(
              padding: EdgeInsets.all(8),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.lightBlueAccent,
                  height: 50,
                  child: ListTile(title: Text(nombres[index])),
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: nombres.length,
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
