import 'package:flutter/material.dart';
import 'fosforitos_widget.dart';

class EquipoConPuntos extends StatelessWidget {
  final String nombre;
  final int puntos;

  const EquipoConPuntos({
    super.key,
    required this.nombre,
    required this.puntos,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          nombre,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: Center(
            child: FosforitosWidget(puntos: puntos),
          ),
        ),
      ],
    );
  }
}
