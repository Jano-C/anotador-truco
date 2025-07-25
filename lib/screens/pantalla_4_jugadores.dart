import 'package:anotador_truco/config/provider/provider_4jugadores.dart';

import 'package:anotador_truco/widgets/side_menu.dart';
import 'package:anotador_truco/widgets/tablero_cuatro_equipos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Pantalla4Jugadores extends ConsumerWidget {
  const Pantalla4Jugadores({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    final puntosA = ref.watch(equipoA4Provider);
    final puntosB = ref.watch(equipoB4Provider);
    final puntosC = ref.watch(equipoC4Provider);
    final puntosD = ref.watch(equipoD4Provider);

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('4 Equipos', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF2C2C2C),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              ref.read(equipoA4Provider.notifier).state = 0;
              ref.read(equipoB4Provider.notifier).state = 0;
              ref.read(equipoC4Provider.notifier).state = 0;
              ref.read(equipoD4Provider.notifier).state = 0;
            },
          ),
        ],
      ),
      drawer: SideMenu(
        scaffoldKey: scaffoldKey,
        currentIndex: 2,
        ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TableroCuatroEquipos(
          puntosA: puntosA,
          puntosB: puntosB,
          puntosC: puntosC,
          puntosD: puntosD,
          onSumarA: () => ref.read(equipoA4Provider.notifier).state++,
          onRestarA: () => ref.read(equipoA4Provider.notifier).state--,
          onSumarB: () => ref.read(equipoB4Provider.notifier).state++,
          onRestarB: () => ref.read(equipoB4Provider.notifier).state--,
          onSumarC: () => ref.read(equipoC4Provider.notifier).state++,
          onRestarC: () => ref.read(equipoC4Provider.notifier).state--,
          onSumarD: () => ref.read(equipoD4Provider.notifier).state++,
          onRestarD: () => ref.read(equipoD4Provider.notifier).state--,
          nombreA: 'Equipo A',
          nombreB: 'Equipo B',
          nombreC: 'Equipo C',
          nombreD: 'Equipo D',
        ),
      ),
    );
  }
}
