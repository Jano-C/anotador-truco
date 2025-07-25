import 'package:flutter/material.dart';

class TableroCuatroEquipos extends StatelessWidget {
  final int puntosA, puntosB, puntosC, puntosD;
  final VoidCallback onSumarA, onRestarA;
  final VoidCallback onSumarB, onRestarB;
  final VoidCallback onSumarC, onRestarC;
  final VoidCallback onSumarD, onRestarD;
  final String nombreA, nombreB, nombreC, nombreD;

  const TableroCuatroEquipos({
    super.key,
    required this.puntosA,
    required this.puntosB,
    required this.puntosC,
    required this.puntosD,
    required this.onSumarA,
    required this.onRestarA,
    required this.onSumarB,
    required this.onRestarB,
    required this.onSumarC,
    required this.onRestarC,
    required this.onSumarD,
    required this.onRestarD,
    required this.nombreA,
    required this.nombreB,
    required this.nombreC,
    required this.nombreD,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    return Column(
      children: [
        Expanded(
          child: filaEquipo(nombreA, puntosA, onSumarA, onRestarA, textStyle),
        ),
        Expanded(
          child: filaEquipo(nombreB, puntosB, onSumarB, onRestarB, textStyle),
        ),
        Expanded(
          child: filaEquipo(nombreC, puntosC, onSumarC, onRestarC, textStyle),
        ),
        Expanded(
          child: filaEquipo(nombreD, puntosD, onSumarD, onRestarD, textStyle),
        ),
        const SizedBox(height: 200),
      ],
    );
  }

  Widget filaEquipo(String nombre, int puntos, VoidCallback onSumar, VoidCallback onRestar, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(nombre, style: style),
          Row(
            children: [
              IconButton(
                onPressed: onRestar,
                icon: const Icon(Icons.remove_circle_outline),
                iconSize: 40,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text('$puntos', style: TextStyle(fontSize: 60, color: Colors.white)),
              SizedBox(width: 10),
              IconButton(
                onPressed: onSumar,
                icon: const Icon(Icons.add_circle_outline),
                iconSize: 40,
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
