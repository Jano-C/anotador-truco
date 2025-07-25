import 'package:flutter/material.dart';
import 'package:anotador_truco/widgets/botones_suma_resta.dart';

class TableroTresEquipos extends StatelessWidget {
  final int puntosA;
  final int puntosB;
  final int puntosC;

  final VoidCallback onSumarA;
  final VoidCallback onRestarA;
  final VoidCallback onSumarB;
  final VoidCallback onRestarB;
  final VoidCallback onSumarC;
  final VoidCallback onRestarC;

  final String nombreA;
  final String nombreB;
  final String nombreC;

  const TableroTresEquipos({
    super.key,
    required this.puntosA,
    required this.puntosB,
    required this.puntosC,
    required this.onSumarA,
    required this.onRestarA,
    required this.onSumarB,
    required this.onRestarB,
    required this.onSumarC,
    required this.onRestarC,
    required this.nombreA,
    required this.nombreB,
    required this.nombreC,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildCol(nombreA, puntosA, onSumarA, onRestarA),
        _buildCol(nombreB, puntosB, onSumarB, onRestarB),
        _buildCol(nombreC, puntosC, onSumarC, onRestarC),
      ],
    );
  }

  Widget _buildCol(String nombre, int puntos, VoidCallback onSumar, VoidCallback onRestar) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(nombre, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 10),
          Text('$puntos', style: const TextStyle(fontSize: 60, color: Colors.white)),
          const SizedBox(height: 20),
          BotonesSumRest(onSumar: onSumar, onRestar: onRestar),
        ],
      ),
    );
  }
}
