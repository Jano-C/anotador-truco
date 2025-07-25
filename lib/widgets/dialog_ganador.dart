import 'package:flutter/material.dart';

class DialogGanador extends StatelessWidget {
  final String equipo;
  final VoidCallback onReiniciar;

  const DialogGanador({
    Key? key,
    required this.equipo,
    required this.onReiniciar,
  }) : super(key: key);

  static void mostrarGanador(BuildContext context, String equipo, VoidCallback onReiniciar) {
    final textoEquipo = equipo == 'A' ? '¡Ganamos nosotros!' : '¡Ganan ellos!';
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF2C2C2C),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          textoEquipo,
          style: const TextStyle(
            color: Color(0xFFF0F0F0),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          textAlign: TextAlign.center,
        ),
        
        actions: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF22C55E),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                onReiniciar();
              },
              child: const Text(
                'Reiniciar',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Este widget no se usará directamente porque usaremos el método estático
    return const SizedBox.shrink();
  }
}
