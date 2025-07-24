import 'package:flutter/material.dart';
import '../services/local_storage_service.dart';
import '../widgets/fosforitos_truco_widget.dart';

class TrucoScreen extends StatefulWidget {
  const TrucoScreen({super.key});

  @override
  State<TrucoScreen> createState() => _TrucoScreenState();
}

class _TrucoScreenState extends State<TrucoScreen> {
  int puntosA = 0;
  int puntosB = 0;

  @override
  void initState() {
    super.initState();
    puntosA = LocalStorageService.obtenerPuntaje('equipoA');
    puntosB = LocalStorageService.obtenerPuntaje('equipoB');
  }

  void _modificarPuntos(String equipo, int delta) {
    setState(() {
      if (equipo == 'A') {
        puntosA = (puntosA + delta).clamp(0, 30);
        LocalStorageService.guardarPuntaje('equipoA', puntosA);
      } else {
        puntosB = (puntosB + delta).clamp(0, 30);
        LocalStorageService.guardarPuntaje('equipoB', puntosB);
      }
    });
  }

  void _resetear() {
    setState(() {
      puntosA = 0;
      puntosB = 0;
      LocalStorageService.resetear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anotador de Truco'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Resetear puntajes',
            icon: const Icon(Icons.refresh),
            onPressed: _resetear,
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isSmallScreen = constraints.maxWidth < 600;

              if (isSmallScreen) {
                // Layout vertical para pantallas chicas
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildEquipoColumn('A'),
                    const SizedBox(height: 40),
                    _buildEquipoColumn('B'),
                  ],
                );
              } else {
                // Layout horizontal para pantallas grandes
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEquipoColumn('A'),
                    const SizedBox(width: 80),
                    _buildEquipoColumn('B'),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildEquipoColumn(String equipo) {
    final puntos = equipo == 'A' ? puntosA : puntosB;

    Widget botonSumar = ElevatedButton(
      onPressed: () => _modificarPuntos(equipo, 1),
      child: const Icon(Icons.add, size: 30),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(50, 50),
        shape: const CircleBorder(),
      ),
    );

    Widget botonRestar = ElevatedButton(
      onPressed: () => _modificarPuntos(equipo, -1),
      child: const Icon(Icons.remove, size: 30),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(50, 50),
        shape: const CircleBorder(),
      ),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Equipo $equipo',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            botonRestar,
            const SizedBox(width: 16),
            botonSumar,
          ],
        ),
        const SizedBox(height: 24),
        FosforitosTrucoWidget(puntos: puntos),
      ],
    );
  }
}
