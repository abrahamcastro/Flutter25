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
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Material App Bar')),
        body: StreamBuilder(
          stream: datos.onValue,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              final contenido = (snapshot.data!).snapshot.value as Map;
              final pedidos = contenido.entries.toList();

              return ListView.builder(
                itemCount: pedidos.length,
                itemBuilder: (context, index) {
                  final pedidoData = pedidos[index].value as Map;

                  final nombreCliente = pedidoData.keys.first;
                  final productos = List<String>.from(
                    pedidoData[nombreCliente],
                  );

                  return ListTile(
                    title: Text(nombreCliente),
                    subtitle: Text(productos.join(', ')),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
