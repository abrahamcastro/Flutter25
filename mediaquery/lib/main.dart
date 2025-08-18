import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Material App Bar')),
        body: Container(
          margin: EdgeInsets.all(16),
          color: Colors.amber,
          child: Center(
            child: Container(
              width: size.width * 0.4,
              height: size.height * 0.4,
              color: Colors.green,
              child: const Center(child: Text('Adaptado con MediaQuery')),
            ),
          ),
        ),
      ),
    );
  }
}
