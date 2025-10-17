import 'package:carrito2/carrito.dart';
import 'package:carrito2/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Pagina1());
}

List<String> productos = [];
RxInt contar = 0.obs;

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<Pagina1> createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                  icon: Badge(
                    label: Obx(() => Text(contar.value.toString())),
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.shopping_cart),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Carrito()),
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    productos.add('capuchino');
                    contar.value++;
                  });
                },
                child: Image(
                  image: AssetImage('assets/images/cafe1.png'),
                  height: 100,
                  width: 100,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    productos.add('Rockachino');
                    contar.value++;
                  });
                },
                child: Image.network(
                  'https://img0.didiglobal.com/static/soda_public/do1_m1EaPF62wASHuAseGWDe',
                  height: 100,
                  width: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
