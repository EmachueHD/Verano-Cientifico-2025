import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Actividad {
  String nombreActividad;
  String descripcionActividad;
  String fechaInicio;
  String fechaTermino;
  String horaInicio;
  String horaTermino;
  String tipoActividad;
  String responsable;
  String lugarActividad;
  String imagenActividad;

  Actividad({
    required this.nombreActividad,
    required this.descripcionActividad,
    required this.fechaInicio,
    required this.fechaTermino,
    required this.horaInicio,
    required this.horaTermino,
    required this.tipoActividad,
    required this.responsable,
    required this.lugarActividad,
    required this.imagenActividad,
  });

  factory Actividad.fromJson(Map<String, dynamic> json) {
    return Actividad(
      nombreActividad: json['nombreActividad'],
      descripcionActividad: json['descripcionActividad'],
      fechaInicio: json['fechaInicio'],
      fechaTermino: json['fechaTermino'],
      horaInicio: json['horaInicio'],
      horaTermino: json['horaTermino'],
      tipoActividad: json['tipoActividad'],
      responsable: json['responsable'],
      lugarActividad: json['lugarActividad'],
      imagenActividad: json['imagenActividad'],
    );
  }
}

Future<Actividad> fetchActividad() async {
  final response = await http.get(
    Uri.parse("https://example.com/actividad.json"),
  );
  if (response.statusCode == 200) {
    return Actividad.fromJson(json.decode(response.body));
  } else {
    throw Exception("Error al cargar actividad");
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Image.asset(
              "assets/header.jpg",
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: FutureBuilder<Actividad>(
                future: fetchActividad(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (snapshot.hasData) {
                    final actividad = snapshot.data!;
                    return ListView(
                      padding: EdgeInsets.all(16),
                      children: [
                        Text(
                          actividad.nombreActividad,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: "times_new_roman.ttf",
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(actividad.descripcionActividad),
                        SizedBox(height: 8),
                        Text("Fecha de inicio: ${actividad.fechaInicio}"),
                        Text("Fecha de término: ${actividad.fechaTermino}"),
                        Text("Hora de inicio: ${actividad.horaInicio}"),
                        Text("Hora de término: ${actividad.horaTermino}"),
                        Text("Tipo de Actividad: ${actividad.tipoActividad}"),
                        Text("Responsable: ${actividad.responsable}"),
                        Text("Ubicación: ${actividad.lugarActividad}"),
                        SizedBox(height: 12),
                        Image.network(actividad.imagenActividad),
                      ],
                    );
                  } else {
                    return Center(child: Text("No hay datos"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
