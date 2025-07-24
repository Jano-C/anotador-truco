import 'dart:html';

/// Servicio para guardar y recuperar puntajes usando localStorage del navegador
class LocalStorageService {
  /// Guarda el puntaje del [equipo] en localStorage
  static void guardarPuntaje(String equipo, int puntos) {
    window.localStorage[equipo] = puntos.toString();
  }

  /// Obtiene el puntaje guardado del [equipo]. Si no existe, retorna 0.
  static int obtenerPuntaje(String equipo) {
    return int.tryParse(window.localStorage[equipo] ?? '0') ?? 0;
  }

  /// Borra los puntajes almacenados para ambos equipos
  static void resetear() {
    window.localStorage.remove('equipoA');
    window.localStorage.remove('equipoB');
  }
}
