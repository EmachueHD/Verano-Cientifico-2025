import 'dart:convert'; //Para trabajar con JSON
import 'package:http/http.dart' as http; //Para hacer la petición HTTP
import 'package:flutter/material.dart';

//Modelo que representa la actividad
class VistaIndividualUNPA {
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

  //Constructor con parámetros requeridos
  VistaIndividualUNPA({
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

  //Constructor alterno que construye el objeto a partir de JSON
  factory VistaIndividualUNPA.fromJson(Map<String, dynamic> json) {
    return VistaIndividualUNPA(
      nombreActividad: json['nombreActividad'] ?? '',
      descripcionActividad: json['descripcionActividad'] ?? '',
      fechaInicio: json['fechaInicio'] ?? '',
      fechaTermino: json['fechaTermino'] ?? '',
      horaInicio: json['horaInicio'] ?? '',
      horaTermino: json['horaTermino'] ?? '',
      tipoActividad: json['tipoActividad'] ?? '',
      responsable: json['responsable'] ?? '',
      lugarActividad: json['lugarActividad'] ?? '',
      imagenActividad: json['imagenActividad'] ?? '',
    );
  }
}

//Obtener la actividad desde un endpoint
Future<VistaIndividualUNPA> fetchActividad() async {
  final response = await http.get(
    Uri.parse(" "), //ENLACE
  );
  if (response.statusCode == 200) {
    return VistaIndividualUNPA.fromJson(json.decode(response.body));
  } else {
    throw Exception("Error al cargar actividad");
  }
}

void main() {
  runApp(MyApp()); //Arranca la aplicación
}

//Clase principal de la app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vista Individual Actividades UNPA',
      debugShowCheckedModeBanner: false, // Quita el banner DEBUG
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.assets(
            'Verano-Científico-2025/assets/header.jpg', //Imagen del logo
            width: double.infinity, //Ocupa todo el ancho
            fit: BoxFit.cover, //Se ajusta al espacio
          ),
          toolbarHeight: 100,
          centerTitle: true,
        ),
        body: FutureBuilder<VistaIndividualUNPA>(
          future: fetchActividad(), //Llama al Future
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              ); //Mientras carga
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              ); //En caso de fallar
            } else if (snapshot.hasData) {
              final actividad = snapshot.data!; //Obtiene la actividad

              return Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        actividad.nombreActividad,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      actividad.descripcionActividad,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 15),

                    //Mostrar fecha de inicio de la actividad
                    Row(
                      children: [
                        Text(
                          "Fecha de Inicio: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          actividad.fechaInicio,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),

                    //Mostrar hora de inicio de la actividad
                    Row(
                      children: [
                        Text(
                          "Hora de Inicio: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          actividad.horaInicio,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),

                    //Mostrar fecha de finalización de la actividad
                    Row(
                      children: [
                        Text(
                          "Fecha de Finalización: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          actividad.fechaTermino,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),

                    //Mostrar hora de finalización de la actividad
                    Row(
                      children: [
                        Text(
                          "Hora de Finalización: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          actividad.horaTermino,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),

                    //Mostrar tipo de actividad
                    Row(
                      children: [
                        Text(
                          "Tipo de Actividad: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          actividad.tipoActividad,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),

                    //Mostrar quien es el/la responsable de la actividad
                    Row(
                      children: [
                        Text(
                          "Responsable: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          actividad.responsable,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),

                    //Mostrar lugar donde se realizará la actividad
                    Row(
                      children: [
                        Text(
                          "Ubicación: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          actividad.lugarActividad,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),

                    //Mostrar imagen de la actividad si está disponible
                    SizedBox(height: 10),
                    actividad.imagenActividad.isNotEmpty
                        ? Image.network(actividad.imagenActividad, height: 200)
                        : Text("Sin imagen disponible"),

                    Spacer(), // Empuja el botón hacia abajo
                    //Botón para ir a la vista general
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Salir"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: Text("No hay datos disponibles"));
            }
          },
        ),
      ),
    );
  }
}
