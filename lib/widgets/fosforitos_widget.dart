import 'package:flutter/material.dart';
import 'cuadros_fosforitos.dart';

class FosforitosWidget extends StatelessWidget {
  final int puntos;

  const FosforitosWidget({super.key, required this.puntos});

  @override
  Widget build(BuildContext context) {
    return CuadrosFosforitos(puntos: puntos);
  }
}
