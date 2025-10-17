import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore2/firebase_options.dart';
import 'package:flutter/material.dart';

final CollectionReference usuarios = FirebaseFirestore.instance.collection(
  'usuarios',
);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Material App Bar')),
        body: ElevatedButton(
          onPressed: () {
            usuarios.add({'nombre': 'Abraham'});
          },
          child: Text('Guardar'),
        ),
      ),
    );
  }
}
