import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:anotador_truco/widgets/tablero_tres_equipos.dart';
import 'package:anotador_truco/widgets/side_menu.dart';
import 'package:anotador_truco/config/provider/provider_3jugadores.dart';
import 'package:anotador_truco/services/guardarPuntos.dart';

class Pantalla3Jugadores extends ConsumerStatefulWidget {
  const Pantalla3Jugadores({super.key});

  @override
  ConsumerState<Pantalla3Jugadores> createState() => _Pantalla3JugadoresState();
}

class _Pantalla3JugadoresState extends ConsumerState<Pantalla3Jugadores> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _cargarPuntajes();
  }

  Future<void> _cargarPuntajes() async {
    final puntosA = await LocalStorageService.obtenerPuntaje('equipoA3');
    final puntosB = await LocalStorageService.obtenerPuntaje('equipoB3');
    final puntosC = await LocalStorageService.obtenerPuntaje('equipoC3');

    ref.read(equipoA3Provider.notifier).state = puntosA;
    ref.read(equipoB3Provider.notifier).state = puntosB;
    ref.read(equipoC3Provider.notifier).state = puntosC;
  }

  void _guardar(String equipo, int puntos) {
    LocalStorageService.guardarPuntaje(equipo, puntos);
  }

  void _resetear() {
    ref.read(equipoA3Provider.notifier).state = 0;
    ref.read(equipoB3Provider.notifier).state = 0;
    ref.read(equipoC3Provider.notifier).state = 0;
    LocalStorageService.resetearEquipos(['equipoA3', 'equipoB3', 'equipoC3']);
  }

  @override
  Widget build(BuildContext context) {
    final puntosA = ref.watch(equipoA3Provider);
    final puntosB = ref.watch(equipoB3Provider);
    final puntosC = ref.watch(equipoC3Provider);

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('3 Equipos', style: TextStyle(color: Colors.white)),
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
        currentIndex: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TableroTresEquipos(
          puntosA: puntosA,
          puntosB: puntosB,
          puntosC: puntosC,
          onSumarA: () {
            ref.read(equipoA3Provider.notifier).state++;
            _guardar('equipoA3', ref.read(equipoA3Provider));
          },
          onRestarA: () {
            ref.read(equipoA3Provider.notifier).state--;
            _guardar('equipoA3', ref.read(equipoA3Provider));
          },
          onSumarB: () {
            ref.read(equipoB3Provider.notifier).state++;
            _guardar('equipoB3', ref.read(equipoB3Provider));
          },
          onRestarB: () {
            ref.read(equipoB3Provider.notifier).state--;
            _guardar('equipoB3', ref.read(equipoB3Provider));
          },
          onSumarC: () {
            ref.read(equipoC3Provider.notifier).state++;
            _guardar('equipoC3', ref.read(equipoC3Provider));
          },
          onRestarC: () {
            ref.read(equipoC3Provider.notifier).state--;
            _guardar('equipoC3', ref.read(equipoC3Provider));
          },
          nombreA: 'Equipo A',
          nombreB: 'Equipo B',
          nombreC: 'Equipo C',
        ),
      ),
    );
  }
}
