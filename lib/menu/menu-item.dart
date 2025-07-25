import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String link;

  MenuItem({
    required this.title,
    required this.icon,
    required this.link,
  });
}
List<MenuItem> menuItems = [
  MenuItem(
    title: 'Truquito',
    icon: Icons.looks_two,
    link: '/',
  ),
  MenuItem(
    title: '3 Jugadores',
    icon: Icons.looks_3,
    link: '/tres',
  ),
  MenuItem(
    title: '4 Jugadores',
    icon: Icons.looks_4,
    link: '/cuatro',
  ),
];