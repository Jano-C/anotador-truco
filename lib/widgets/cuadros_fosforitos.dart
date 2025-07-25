import 'package:anotador_truco/config/apptextcolor.dart';
import 'package:flutter/material.dart';

/// Muestra grupos de fosforitos para representar puntos de Truco.
/// Cada 5 puntos forman un cuadrado con palitos en forma de caja + tachado.
class CuadrosFosforitos extends StatelessWidget {
  final int puntos;

  const CuadrosFosforitos({Key? key, required this.puntos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final grupos = (puntos / 5).ceil();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(grupos, (index) {
        final puntosRestantes = puntos - (index * 5);
        final puntosGrupo = puntosRestantes >= 5 ? 5 : puntosRestantes;

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: _GrupoFosforito(cantidad: puntosGrupo),
            ),
            if (index == 2) const SizedBox(height: 30), // espacio extra después del tercer grupo
          ],
        );
      }),
    );
  }
}

/// Un grupo de 1 a 5 fosforitos dispuestos como un cuadrado.
class _GrupoFosforito extends StatelessWidget {
  final int cantidad;

  const _GrupoFosforito({required this.cantidad});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 68,
      height: 68,
      child: Stack(
        children: [
          if (cantidad >= 1) _palito(top: 0, left: 5, right: 5),
          if (cantidad >= 2) _palito(top: 5, right: 0, bottom: 5, horizontal: false),
          if (cantidad >= 3) _palito(bottom: 0, left: 5, right: 5),
          if (cantidad >= 4) _palito(top: 5, left: 0, bottom: 5, horizontal: false),
          if (cantidad >= 5) _cruz(),
        ],
      ),
    );
  }

  Widget _palito({
    double? top,
    double? bottom,
    double? left,
    double? right,
    bool horizontal = true,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: horizontal ? 72 : 4,
        height: horizontal ? 4 : 72,
        color: AppTextColor.primary,
      ),
    );
  }

  Widget _cruz() {
    return Center(
      child: Transform.rotate(
        angle: 0.785398, // 45 grados (π/4)
        child: Container(
          width: 4,
          height: 72,
          color: AppTextColor.primary,
        ),
      ),
    );
  }
}
