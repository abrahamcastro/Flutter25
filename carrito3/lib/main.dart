import 'package:carrito3/pagina2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

RxInt contar = 0.obs;
List<String> productos = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
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
                    MaterialPageRoute route = MaterialPageRoute(
                      builder: (context) => Pagina2(),
                    );
                    Navigator.push(context, route);
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
                  child: Image.asset(height: 50, 'cafe1.png'),
                  onTap: () {
                    contar.value++;
                    productos.add('Cafe1');
                  },
                ),
                GestureDetector(
                  child: Image.network(
                    height: 50,
                    'https://img0.didiglobal.com/static/soda_public/do1_m1EaPF62wASHuAseGWDe',
                  ),
                  onTap: () {
                    contar.value++;
                    productos.add('Cafe2');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
