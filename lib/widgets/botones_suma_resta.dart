import 'package:flutter/material.dart';

class BotonesSumRest extends StatelessWidget {
  final VoidCallback onSumar;
  final VoidCallback onRestar;

  const BotonesSumRest({
    super.key,
    required this.onSumar,
    required this.onRestar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(12),
          ),
          onPressed: onSumar,
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(12),
          ),
          onPressed: onRestar,
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
