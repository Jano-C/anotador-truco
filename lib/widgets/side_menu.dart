import 'package:anotador_truco/menu/menu-item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final int currentIndex;

  const SideMenu({
    super.key,
    required this.scaffoldKey,
    this.currentIndex = 0,
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  late int navDrawerIndex;

  @override
  void initState() {
    super.initState();
    navDrawerIndex = widget.currentIndex; // ✅ inicialización
  }

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    final backgroundColor = const Color(0xFF1E1E1E); // gris oscuro que querés
    final iconColor = Colors.white;
    final textColor = Colors.white;

    return Container(
      color: backgroundColor,
      child: NavigationDrawer(
        backgroundColor: backgroundColor,
        surfaceTintColor: Colors.transparent, // elimina brillo
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });

          final menuItem = menuItems[value];
          context.go(menuItem.link);
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
            child: Text(
              'Modo de juego',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          ...menuItems.map(
            (item) => NavigationDrawerDestination(
              icon: Icon(item.icon, color: iconColor),
              label: Text(
                item.title,
                style: TextStyle(color: textColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
