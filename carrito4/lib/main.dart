import 'package:carrito4/carrito.dart';
import 'package:carrito4/pedidos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

List<String> productos = [];
RxInt contador = 0.obs;

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
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Menu Cafe'),
          actions: [
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PedidosPage(),
                      ),
                    );
                  },
                  child: Text('Ver Pedidos'),
                );
              },
            ),
            Builder(
              builder: (context) {
                return IconButton(
                  icon: Badge(
                    label: Obx(() => Text(contador.value.toString())),
                    child: const Icon(Icons.shopping_cart),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Carrito()),
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    contador.value++;
                    productos.add('Cafe1');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      'https://img0.didiglobal.com/static/soda_public/do1_m1EaPF62wASHuAseGWDe',
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    contador.value++;
                    productos.add('Cafe2');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      'https://www.chilitochoc.com/wp-content/uploads/2022/12/homemade-caramel-latte-ft.jpg',
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
