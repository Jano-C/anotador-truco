import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:anotador_truco/widgets/tablero_cuatro_equipos.dart';
import 'package:anotador_truco/widgets/side_menu.dart';
import 'package:anotador_truco/config/provider/provider_4jugadores.dart';
import 'package:anotador_truco/services/guardarPuntos.dart';

class Pantalla4Jugadores extends ConsumerStatefulWidget {
  const Pantalla4Jugadores({super.key});

  @override
  ConsumerState<Pantalla4Jugadores> createState() => _Pantalla4JugadoresState();
}

class _Pantalla4JugadoresState extends ConsumerState<Pantalla4Jugadores> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _cargarPuntajes();
  }

  Future<void> _cargarPuntajes() async {
    final puntosA = await LocalStorageService.obtenerPuntaje('equipoA4');
    final puntosB = await LocalStorageService.obtenerPuntaje('equipoB4');
    final puntosC = await LocalStorageService.obtenerPuntaje('equipoC4');
    final puntosD = await LocalStorageService.obtenerPuntaje('equipoD4');

    ref.read(equipoA4Provider.notifier).state = puntosA;
    ref.read(equipoB4Provider.notifier).state = puntosB;
    ref.read(equipoC4Provider.notifier).state = puntosC;
    ref.read(equipoD4Provider.notifier).state = puntosD;
  }

  void _guardar(String equipo, int puntos) {
    LocalStorageService.guardarPuntaje(equipo, puntos);
  }

  void _resetear() {
    ref.read(equipoA4Provider.notifier).state = 0;
    ref.read(equipoB4Provider.notifier).state = 0;
    ref.read(equipoC4Provider.notifier).state = 0;
    ref.read(equipoD4Provider.notifier).state = 0;

    LocalStorageService.resetearEquipos([
      'equipoA4', 'equipoB4', 'equipoC4', 'equipoD4',
    ]);
  }

  @override
  Widget build(BuildContext context) {
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
            tooltip: "Reiniciar puntaje",
            onPressed: _resetear,
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
          onSumarA: () {
            ref.read(equipoA4Provider.notifier).state++;
            _guardar('equipoA4', ref.read(equipoA4Provider));
          },
          onRestarA: () {
            ref.read(equipoA4Provider.notifier).state--;
            _guardar('equipoA4', ref.read(equipoA4Provider));
          },
          onSumarB: () {
            ref.read(equipoB4Provider.notifier).state++;
            _guardar('equipoB4', ref.read(equipoB4Provider));
          },
          onRestarB: () {
            ref.read(equipoB4Provider.notifier).state--;
            _guardar('equipoB4', ref.read(equipoB4Provider));
          },
          onSumarC: () {
            ref.read(equipoC4Provider.notifier).state++;
            _guardar('equipoC4', ref.read(equipoC4Provider));
          },
          onRestarC: () {
            ref.read(equipoC4Provider.notifier).state--;
            _guardar('equipoC4', ref.read(equipoC4Provider));
          },
          onSumarD: () {
            ref.read(equipoD4Provider.notifier).state++;
            _guardar('equipoD4', ref.read(equipoD4Provider));
          },
          onRestarD: () {
            ref.read(equipoD4Provider.notifier).state--;
            _guardar('equipoD4', ref.read(equipoD4Provider));
          },
          nombreA: 'Equipo A',
          nombreB: 'Equipo B',
          nombreC: 'Equipo C',
          nombreD: 'Equipo D',
        ),
      ),
    );
  }
}
