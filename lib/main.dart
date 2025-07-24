import 'package:flutter/material.dart';
import 'screens/truco_screen.dart';

/// Punto de entrada de la app
void main() {
  runApp(const MyApp());
}

/// Widget principal que configura MaterialApp y la pantalla inicial
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anotador de Truco',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const TrucoScreen(),
    );
  }
}
