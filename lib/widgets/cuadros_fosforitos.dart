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

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6), // separación vertical entre grupos
          child: _GrupoFosforito(cantidad: puntosGrupo),
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
      width: 36,
      height: 36,
      child: Stack(
        children: [
          if (cantidad >= 1) _palito(top: 0, left: 6, right: 6),
          if (cantidad >= 2) _palito(top: 6, right: 0, bottom: 6, horizontal: false),
          if (cantidad >= 3) _palito(bottom: 0, left: 6, right: 6),
          if (cantidad >= 4) _palito(top: 6, left: 0, bottom: 6, horizontal: false),
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
        width: horizontal ? null : 2,
        height: horizontal ? 2 : null,
        color: Colors.black,
      ),
    );
  }

  Widget _cruz() {
    return Center(
      child: Transform.rotate(
        angle: 0.785398, // 45 grados (π/4)
        child: Container(
          width: 2,
          height: 36,
          color: Colors.black,
        ),
      ),
    );
  }
}
