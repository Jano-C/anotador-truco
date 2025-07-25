import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static Future<void> guardarPuntaje(String equipo, int puntos) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(equipo, puntos);
  }

  static Future<int> obtenerPuntaje(String equipo) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(equipo) ?? 0;
  }

  static Future<void> resetear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('equipoA');
    await prefs.remove('equipoB');
  }
}
