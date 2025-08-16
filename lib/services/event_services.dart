import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/event.dart';

class EventService {
  final String baseUrl = 'https://tu-backend.com/api'; // Cambia a tu URL

  Future<void> enviarEvento(Event event) async {
    final url = Uri.parse('$baseUrl/events');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(event.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Evento enviado correctamente');
    } else {
      print('Error al enviar el evento: ${response.statusCode}');
    }
  }
}
