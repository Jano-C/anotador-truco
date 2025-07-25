import 'package:anotador_truco/config/apptextcolor.dart';
import 'package:anotador_truco/services/guardarPuntos.dart';
import 'package:anotador_truco/widgets/botones_suma_resta.dart';
import 'package:anotador_truco/widgets/cuadros_fosforitos.dart';
import 'package:anotador_truco/widgets/dialog_ganador.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int puntosEquipoA = 0;
  int puntosEquipoB = 0;

  @override
void initState() {
  super.initState();
  _cargarPuntajes();
}

Future<void> _cargarPuntajes() async {
  final puntosA = await LocalStorageService.obtenerPuntaje('equipoA');
  final puntosB = await LocalStorageService.obtenerPuntaje('equipoB');
  setState(() {
    puntosEquipoA = puntosA;
    puntosEquipoB = puntosB;
  });
}

void sumarPuntoA() {
  if (puntosEquipoA < 30) {
    setState(() {
      puntosEquipoA++;
      if (puntosEquipoA == 30) {
      DialogGanador.mostrarGanador(context, 'A', reiniciarPuntos);
    }
    });
     LocalStorageService.guardarPuntaje('equipoA', puntosEquipoA);
  }
}


  void restarPuntoA() {
    if (puntosEquipoA > 0) {
      setState(() {
        puntosEquipoA--;
      });
       LocalStorageService.guardarPuntaje('equipoA', puntosEquipoA);
    }
  }

  void sumarPuntoB() {
    if (puntosEquipoB < 30) {
      setState(() {
        puntosEquipoB++;
      });
      if (puntosEquipoB == 30) {
      DialogGanador.mostrarGanador(context, 'B', reiniciarPuntos);
    }}
     LocalStorageService.guardarPuntaje('equipoB', puntosEquipoA);
  }

  void restarPuntoB() {
    if (puntosEquipoB > 0) {
      setState(() {
        puntosEquipoB--;
      });
      LocalStorageService.guardarPuntaje('equipoB', puntosEquipoA);
    }
  }

  void reiniciarPuntos() {
    setState(() {
      puntosEquipoA = 0;
      puntosEquipoB = 0;
    });
    LocalStorageService.resetear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C2C2C),
        title: const Text('Truquito',
        style: TextStyle(color: AppTextColor.primary),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh,color: AppTextColor.primary),
            tooltip: "Reiniciar puntaje",
            onPressed: reiniciarPuntos,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(maxWidth: 600),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 268), // margen superior opcional para ajustar la altura exacta
                  BotonesSumRest(
                    onSumar: sumarPuntoA,
                    onRestar: restarPuntoA,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Nos',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color:  AppTextColor.primary),
                  ),
                  const SizedBox(height: 20),
                  Expanded(child: CuadrosFosforitos(puntos: puntosEquipoA)),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Ellos',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color:  AppTextColor.primary),
                  ),
                  const SizedBox(height: 20),
                  Expanded(child: CuadrosFosforitos(puntos: puntosEquipoB)),
                ],
              ),
            ),
            Expanded(
              flex: 1,
             child: Column(
              mainAxisAlignment: MainAxisAlignment.start, 
              children: [
                const SizedBox(height: 268), // margen superior opcional para ajustar la altura exacta
                BotonesSumRest(
                  onSumar: sumarPuntoB,
                  onRestar: restarPuntoB,
                ),
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}