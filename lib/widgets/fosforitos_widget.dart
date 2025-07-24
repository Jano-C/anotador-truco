import 'package:flutter/material.dart';

class FosforitosWidget extends StatelessWidget {
  final int puntos;

  const FosforitosWidget({super.key, required this.puntos});

  @override
  Widget build(BuildContext context) {
    final fosforitos = <Widget>[];

    for (int i = 0; i < puntos ~/ 5; i++) {
      fosforitos.add(_buildCuadradoTachado());
    }

    int resto = puntos % 5;
    if (resto > 0) {
      fosforitos.add(_buildPalitos(resto));
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: fosforitos,
    );
  }

  Widget _buildPalitos(int cantidad) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(cantidad, (_) => _buildPalito()),
    );
  }

  Widget _buildPalito() {
    return Container(
      width: 4,
      height: 20,
      color: Colors.black,
      margin: const EdgeInsets.symmetric(horizontal: 2),
    );
  }

  Widget _buildCuadradoTachado() {
    return SizedBox(
      width: 24,
      height: 24,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black),
            ),
          ),
          Transform.rotate(
            angle: 0.785, // 45 grados
            child: Container(width: 2, height: 28, color: Colors.black),
          ),
          Transform.rotate(
            angle: -0.785,
            child: Container(width: 2, height: 28, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
