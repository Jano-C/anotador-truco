
import 'package:anotador_truco/config/Theme/apptextcolor.dart';
import 'package:anotador_truco/services/guardarPuntos.dart';
import 'package:anotador_truco/widgets/dialog_ganador.dart';
import 'package:anotador_truco/widgets/side_menu.dart';
import 'package:anotador_truco/widgets/tablero_dos_equipos.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int puntosEquipoA = 0;
  int puntosEquipoB = 0;

  @override
void initState() {
  super.initState();
  _cargarPuntajes();
}

Future<void> _cargarPuntajes() async {
  final puntosA = await LocalStorageService.obtenerPuntaje('equipoA');
  final puntosB = await LocalStorageService.obtenerPuntaje('equipoB');
  setState(() {
    puntosEquipoA = puntosA;
    puntosEquipoB = puntosB;
  });
}

  @override
 Widget build(BuildContext context) {
  
  final scaffoldKey = GlobalKey<ScaffoldState>();

  return Scaffold(
    key: scaffoldKey,
    drawer: SideMenu(scaffoldKey: scaffoldKey),
      backgroundColor: const Color(0xFF1E1E1E),
      
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white), 
        backgroundColor: const Color(0xFF2C2C2C),
        title: const Text('Truquito',
        style: TextStyle(color: AppTextColor.primary),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh,color: AppTextColor.primary),
            tooltip: "Reiniciar puntaje",
            onPressed: reiniciarPuntos,
          ),
        ],
      ),
      
      body: Container(
  padding: const EdgeInsets.all(16),
  constraints: const BoxConstraints(maxWidth: 600),
  child: TableroDosEquipos(
    puntosEquipoA: puntosEquipoA,
    puntosEquipoB: puntosEquipoB,
    onSumarA: sumarPuntoA,
    onRestarA: restarPuntoA,
    onSumarB: sumarPuntoB,
    onRestarB: restarPuntoB,
    ),
      ),
        );

  }
  
void sumarPuntoA() {
  if (puntosEquipoA < 30) {
    setState(() {
      puntosEquipoA++;
      if (puntosEquipoA == 30) {
      DialogGanador.mostrarGanador(context, 'A', reiniciarPuntos);
    }
    });
     LocalStorageService.guardarPuntaje('equipoA', puntosEquipoA);
  }
}


  void restarPuntoA() {
    if (puntosEquipoA > 0) {
      setState(() {
        puntosEquipoA--;
      });
       LocalStorageService.guardarPuntaje('equipoA', puntosEquipoA);
    }
  }

  void sumarPuntoB() {
    if (puntosEquipoB < 30) {
      setState(() {
        puntosEquipoB++;
      });
      if (puntosEquipoB == 30) {
      DialogGanador.mostrarGanador(context, 'B', reiniciarPuntos);
    }}
     LocalStorageService.guardarPuntaje('equipoB', puntosEquipoB);
  }

  void restarPuntoB() {
    if (puntosEquipoB > 0) {
      setState(() {
        puntosEquipoB--;
      });
      LocalStorageService.guardarPuntaje('equipoB', puntosEquipoB);
    }
  }

  void reiniciarPuntos() {
    setState(() {
      puntosEquipoA = 0;
      puntosEquipoB = 0;
    });
    LocalStorageService.resetear();
  }

}