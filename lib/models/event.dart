class Event {
  String nombre;
  String descripcion;
  String lugar;
  String fechaInicio;
  String fechaTermino;
  String horaInicio;

  Event({
    required this.nombre,
    required this.descripcion,
    required this.lugar,
    required this.fechaInicio,
    required this.fechaTermino,
    required this.horaInicio,
  });

  // Convierte el objeto a JSON
  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'descripcion': descripcion,
      'lugar': lugar,
      'fecha_inicio': fechaInicio,
      'fecha_termino': fechaTermino,
      'hora_inicio': horaInicio,
    };
  }
}
