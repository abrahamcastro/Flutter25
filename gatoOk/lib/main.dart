import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Juego(),
      ),
    );
  }
}

class player {
  static const none = '';
  static const X = 'X';
  static const O = 'O';
}

class Juego extends StatefulWidget {
  const Juego({Key? key}) : super(key: key);

  @override
  State<Juego> createState() => _JuegoState();
}

class _JuegoState extends State<Juego> {
  List<String> numeros = ['', '', '', '', '', '', '', '', ''];
  int maximo = 9;
  String ultimoValor = player.none;
  @override
  void initState() {
    super.initState();
    iniciarLista();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [boton(0), boton(1), boton(2)],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [boton(3), boton(4), boton(5)],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [boton(6), boton(7), boton(8)],
        )
      ],
    );
  }

  void iniciarLista() {
    List.generate(maximo, (index) => numeros[index] = player.none);
  }

  Widget boton(int x) {
    final colores = numeros[x] == player.X
        ? Colors.blue[255]
        : numeros[x] == player.O
            ? Colors.amber
            : Colors.blueGrey;
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            seleccion(numeros[x], x);
          });
        },
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(100, 100), backgroundColor: colores),
        child: Text(
          numeros[x],
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  void seleccion(valor, int x) {
    if (valor == player.none) {
      final nuevoValor = ultimoValor == player.X ? player.O : player.X;
      setState(() {
        ultimoValor = nuevoValor;
        numeros[x] = nuevoValor;
      });
      if (esGanador(x)) {
        mensaje('Gano jugador $ultimoValor');
      } else if (esEmpate()) {
        mensaje('Juego Empatado');
      }
    }
  }

  Future mensaje(String s) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => AlertDialog(
              title: Text(s),
              content: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      iniciarLista();
                    });

                    Navigator.pop(context);
                  },
                  child: const Text('Reiniciar Juego')),
            ));
  }

  bool esGanador(int x) {
    final jugador = numeros[x];
    if (numeros[0] == jugador &&
        numeros[1] == jugador &&
        numeros[2] == jugador) {
      return true;
    }
    if (numeros[3] == jugador &&
        numeros[4] == jugador &&
        numeros[5] == jugador) {
      return true;
    }
    if (numeros[6] == jugador &&
        numeros[7] == jugador &&
        numeros[8] == jugador) {
      return true;
    }
    if (numeros[0] == jugador &&
        numeros[3] == jugador &&
        numeros[6] == jugador) {
      return true;
    }
    if (numeros[1] == jugador &&
        numeros[4] == jugador &&
        numeros[7] == jugador) {
      return true;
    }
    if (numeros[2] == jugador &&
        numeros[5] == jugador &&
        numeros[8] == jugador) {
      return true;
    }
    if (numeros[0] == jugador &&
        numeros[4] == jugador &&
        numeros[8] == jugador) {
      return true;
    }
    if (numeros[2] == jugador &&
        numeros[4] == jugador &&
        numeros[6] == jugador) {
      return true;
    }
    return false;
  }

  bool esEmpate() {
    return numeros.every((tod) => tod != player.none);
  }
}
