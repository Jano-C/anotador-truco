import 'package:anotador_truco/screens/home_screen.dart';
import 'package:anotador_truco/screens/pantalla_3_jugadores.dart';
import 'package:anotador_truco/screens/pantalla_4_jugadores.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/tres',
      builder: (context, state) =>  Pantalla3Jugadores(),
    ),
    GoRoute(
      path: '/cuatro',
      builder: (context, state) =>  Pantalla4Jugadores(), 
    ),
  ],
);
