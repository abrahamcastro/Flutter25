import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
  var data = '';
  List<String> nombresf = [];
  TextEditingController nom1 = TextEditingController();
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
                controller: nom1,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    if (nom1.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('El campo no puede estar vacio'),
                        ),
                      );
                      return;
                    }
                    setState(() {
                      nombresf.add(nom1.text);
                      nom1.clear();
                      // datos.child('nombre').set(nom1.text);
                    });
                  },
                  child: const Text('Guardar'),
                );
              },
            ),
            Text(data),
            ElevatedButton(
              onPressed: () {
                datos.child('nombre').once().then((q) {
                  setState(() {
                    data = q.snapshot.value.toString();
                  });
                });
              },
              child: const Text('ver'),
            ),
            ElevatedButton(
              onPressed: () {
                for (var n in nombresf) {
                  datos.push().set({'nombre': n});
                }
                nombresf.clear();
                //datos.child('nombre').set({'nombre': nom1.text});
              },
              child: const Text('todos'),
            ),
            ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.blueAccent,
                  child: ListTile(title: Text(nombresf[index])),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: nombresf.length,
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
