import 'package:flutter/material.dart';

class Minas extends StatefulWidget {
  const Minas({super.key});

  @override
  State<Minas> createState() => _MinasState();
}

class _MinasState extends State<Minas> {
  List<Color> colores = List.filled(36, Colors.grey);
  final int especial = 7;

  void reiniciar() {
    setState(() {
      colores = List.filled(36, Colors.grey);
    });
  }

  void mostrarGameOver() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Game Over"),
        content: const Text("¡Presionaste el recuadro rojo!"),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Aceptar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Hecho por José Eduardo López Martínez",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 10,
            child: Column(
              children: List.generate(6, (fila) {
                return Expanded(
                  flex: 2,
                  child: Row(
                    children: List.generate(6, (columna) {
                      int index = fila * 6 + columna;
                      return Expanded(
                        flex: 2,
                        child: InkWell(
                          child: Container(
                            color: colores[index],
                          ),
                          onTap: () {
                            setState(() {
                              if (index == especial) {
                                colores[index] = Colors.red;
                                mostrarGameOver();
                              } else {
                                colores[index] = Colors.green;
                              }
                            });
                          },
                        ),
                      );
                    }),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: reiniciar,
                child: const Text("Reiniciar"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
