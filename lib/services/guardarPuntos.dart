import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static Future<void> guardarPuntaje(String clave, int valor) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(clave, valor);
  }

  static Future<int> obtenerPuntaje(String clave) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(clave) ?? 0;
  }

  static Future<void> resetearEquipos(List<String> claves) async {
    final prefs = await SharedPreferences.getInstance();
    for (final clave in claves) {
      await prefs.setInt(clave, 0);
    }
  }
}
