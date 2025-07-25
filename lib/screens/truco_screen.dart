import 'package:anotador_truco/widgets/botones_suma_resta.dart';
import 'package:flutter/material.dart';
import 'package:anotador_truco/widgets/fosforitos_widget.dart'; 

class TrucoScreen extends StatefulWidget {
  const TrucoScreen({super.key});

  @override
  State<TrucoScreen> createState() => _TrucoScreenState();
}

class _TrucoScreenState extends State<TrucoScreen> {
  int puntosEquipoA = 0;
  int puntosEquipoB = 0;

  void sumarPuntoA() {
    if (puntosEquipoA < 30) {
      setState(() {
        puntosEquipoA++;
      });
    }
  }

  void restarPuntoA() {
    if (puntosEquipoA > 0) {
      setState(() {
        puntosEquipoA--;
      });
    }
  }

  void sumarPuntoB() {
    if (puntosEquipoB < 30) {
      setState(() {
        puntosEquipoB++;
      });
    }
  }

  void restarPuntoB() {
    if (puntosEquipoB > 0) {
      setState(() {
        puntosEquipoB--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anotador de Truco'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(maxWidth: 600),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Columna 1: botones suma/resta equipo A, centrado verticalmente
            Expanded(
              flex: 1,
              child: Center(
                child: BotonesSumRest(
                  onSumar: sumarPuntoA,
                  onRestar: restarPuntoA,
                ),
              ),
            ),

            // Columna 2: Equipo A con nombre y fosforitos apilados verticalmente
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Equipo A',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: FosforitosWidget(puntos: puntosEquipoA),
                  ),
                ],
              ),
            ),

            // Columna 3: Equipo B con nombre y fosforitos apilados verticalmente
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Equipo B',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: FosforitosWidget(puntos: puntosEquipoB),
                  ),
                ],
              ),
            ),

            // Columna 4: botones suma/resta equipo B, centrado verticalmente
            Expanded(
              flex: 1,
              child: Center(
                child: BotonesSumRest(
                  onSumar: sumarPuntoB,
                  onRestar: restarPuntoB,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
