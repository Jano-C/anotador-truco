import 'package:anotador_truco/menu/menu-item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:anotador_truco/widgets/tablero_tres_equipos.dart';
import 'package:anotador_truco/widgets/side_menu.dart';
import 'package:anotador_truco/config/provider/provider_3jugadores.dart';

class Pantalla3Jugadores extends ConsumerWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Pantalla3Jugadores({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final puntosA = ref.watch(equipoAProvider);
    final puntosB = ref.watch(equipoBProvider);
    final puntosC = ref.watch(equipoCProvider);

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        
        iconTheme: IconThemeData(color: Colors.white), 
        title: const Text('3 Equipos', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF2C2C2C),
        centerTitle: true,
         actions: [
      IconButton(
        icon: const Icon(Icons.refresh, color: Colors.white),
        tooltip: "Reiniciar puntaje",
        onPressed: () {
         ref.read(equipoAProvider.notifier).state = 0;
         ref.read(equipoBProvider.notifier).state = 0;
         ref.read(equipoCProvider.notifier).state = 0;
      },
    ),
  ],
      ),
      drawer: SideMenu(
        scaffoldKey: scaffoldKey,
        currentIndex: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TableroTresEquipos(
          puntosA: puntosA,
          puntosB: puntosB,
          puntosC: puntosC,
          onSumarA: () => ref.read(equipoAProvider.notifier).state++,
          onRestarA: () => ref.read(equipoAProvider.notifier).state--,
          onSumarB: () => ref.read(equipoBProvider.notifier).state++,
          onRestarB: () => ref.read(equipoBProvider.notifier).state--,
          onSumarC: () => ref.read(equipoCProvider.notifier).state++,
          onRestarC: () => ref.read(equipoCProvider.notifier).state--,
          nombreA: 'Equipo A',
          nombreB: 'Equipo B',
          nombreC: 'Equipo C',
        ),
      ),
    );
  }
}
