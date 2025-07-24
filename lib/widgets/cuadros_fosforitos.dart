import 'package:flutter/material.dart';

/// Widget que dibuja un solo cuadrado de fosforito según [puntos] (0 a 5)
/// El cuadrado se dibuja agregando los lados en orden y finalmente la cruz
class CuadroFosforitoWidget extends StatelessWidget {
  final int puntos;

  const CuadroFosforitoWidget({super.key, required this.puntos})
      : assert(puntos >= 0 && puntos <= 5,
            'Los puntos deben estar entre 0 y 5');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 32,
      child: CustomPaint(
        painter: _FosforitoPainter(puntos),
      ),
    );
  }
}

/// Painter que dibuja los lados y cruz del cuadrado según los puntos
class _FosforitoPainter extends CustomPainter {
  final int puntos;

  _FosforitoPainter(this.puntos);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    const double padding = 4;

    final topLeft = Offset(padding, padding);
    final topRight = Offset(size.width - padding, padding);
    final bottomLeft = Offset(padding, size.height - padding);
    final bottomRight = Offset(size.width - padding, size.height - padding);

    // Dibuja los lados del cuadrado según los puntos
    if (puntos >= 1) {
      canvas.drawLine(topLeft, topRight, paint); // lado superior
    }
    if (puntos >= 2) {
      canvas.drawLine(topRight, bottomRight, paint); // lado derecho
    }
    if (puntos >= 3) {
      canvas.drawLine(bottomRight, bottomLeft, paint); // lado inferior
    }
    if (puntos >= 4) {
      canvas.drawLine(bottomLeft, topLeft, paint); // lado izquierdo
    }

    // Dibuja la cruz en el centro si el punto es 5
    if (puntos == 5) {
      canvas.drawLine(
          Offset(padding, padding),
          Offset(size.width - padding, size.height - padding),
          paint);
      canvas.drawLine(
          Offset(size.width - padding, padding),
          Offset(padding, size.height - padding),
          paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
