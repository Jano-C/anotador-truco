import 'package:anotador_truco/config/Theme/apptextcolor.dart';
import 'package:anotador_truco/widgets/botones_suma_resta.dart';
import 'package:anotador_truco/widgets/cuadros_fosforitos.dart';
import 'package:flutter/material.dart';

class TableroDosEquipos extends StatelessWidget {
  final int puntosEquipoA;
  final int puntosEquipoB;
  final VoidCallback onSumarA;
  final VoidCallback onRestarA;
  final VoidCallback onSumarB;
  final VoidCallback onRestarB;

  const TableroDosEquipos({
    super.key,
    required this.puntosEquipoA,
    required this.puntosEquipoB,
    required this.onSumarA,
    required this.onRestarA,
    required this.onSumarB,
    required this.onRestarB,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 268),
              BotonesSumRest(
                onSumar: onSumarA,
                onRestar: onRestarA,
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
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: AppTextColor.primary),
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
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: AppTextColor.primary),
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
              const SizedBox(height: 268),
              BotonesSumRest(
                onSumar: onSumarB,
                onRestar: onRestarB,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
