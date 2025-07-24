import 'package:anotador_truco/widgets/cuadros_fosforitos.dart';
import 'package:flutter/material.dart';

/// Widget que muestra todos los fosforitos (hasta 6 cuadrados),
/// distribuyendo los puntos en cuadrados completos y parcial
class FosforitosTrucoWidget extends StatelessWidget {
  /// Puntos totales del equipo (0 a 30)
  final int puntos;

  const FosforitosTrucoWidget({super.key, required this.puntos})
      : assert(puntos >= 0 && puntos <= 30,
            'Los puntos deben estar entre 0 y 30');

  @override
  Widget build(BuildContext context) {
    final List<Widget> cuadrados = [];

    // Cuántos cuadrados completos (5 puntos cada uno)
    int completos = puntos ~/ 5;
    int resto = puntos % 5;

    for (int i = 0; i < completos; i++) {
      cuadrados.add(const CuadroFosforitoWidget(puntos: 5));
    }

    if (resto > 0) {
      cuadrados.add(CuadroFosforitoWidget(puntos: resto));
    }
return Column(
  mainAxisSize: MainAxisSize.min,
  children: cuadrados
      .map((cuadro) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: cuadro,
          ))
      .toList(),
);
  }
}
