import 'package:flutter/material.dart';
import 'fosforitos_widget.dart';

class FosforitosTrucoWidget extends StatelessWidget {
  final int puntosA;
  final int puntosB;
  final VoidCallback onSumarA;
  final VoidCallback onRestarA;
  final VoidCallback onSumarB;
  final VoidCallback onRestarB;

  const FosforitosTrucoWidget({
    Key? key,
    required this.puntosA,
    required this.puntosB,
    required this.onSumarA,
    required this.onRestarA,
    required this.onSumarB,
    required this.onRestarB,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _BotoneraVertical(
          onSumar: onSumarA,
          onRestar: onRestarA,
        ),
        const SizedBox(width: 8),
        Expanded(child: FosforitosWidget(puntos: puntosA)),
        const SizedBox(width: 16),
        Expanded(child: FosforitosWidget(puntos: puntosB)),
        const SizedBox(width: 8),
        _BotoneraVertical(
          onSumar: onSumarB,
          onRestar: onRestarB,
        ),
      ],
    );
  }
}

class _BotoneraVertical extends StatelessWidget {
  final VoidCallback onSumar;
  final VoidCallback onRestar;

  const _BotoneraVertical({
    required this.onSumar,
    required this.onRestar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _Boton(icon: Icons.add, onPressed: onSumar),
        const SizedBox(height: 8),
        _Boton(icon: Icons.remove, onPressed: onRestar),
      ],
    );
  }

  Widget _Boton({required IconData icon, required VoidCallback onPressed}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(12),
      ),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
