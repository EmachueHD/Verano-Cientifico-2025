import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class EventFormView extends StatefulWidget {
  const EventFormView({super.key});

  @override
  State<EventFormView> createState() => _EventFormViewState();
}

class _EventFormViewState extends State<EventFormView> {
  // Controllers para los campos del formulario
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController lugarController = TextEditingController();
  final TextEditingController fechaInicioController = TextEditingController();
  final TextEditingController fechaTerminoController = TextEditingController();
  final TextEditingController horaInicioController = TextEditingController();
  final TextEditingController horaTerminoController = TextEditingController();
  final TextEditingController profesorIdController = TextEditingController();

  // Imagen del evento
  Uint8List? imagenBytes;
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    // Liberar los controllers cuando se cierre la vista
    nombreController.dispose();
    descripcionController.dispose();
    lugarController.dispose();
    fechaInicioController.dispose();
    fechaTerminoController.dispose();
    horaInicioController.dispose();
    horaTerminoController.dispose();
    profesorIdController.dispose();
    super.dispose();
  }

  // Función para seleccionar imagen
  Future<void> seleccionarImagen() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      setState(() {
        imagenBytes = bytes;
      });
    }
  }

  // Mock de envío de evento
  Future<void> enviarEventoMock() async {  // 👈 cambiar void a Future<void> y agregar async
    if (imagenBytes == null) {
      print("No se ha seleccionado imagen");
      return;
    }

    final String imagenBase64 = base64Encode(imagenBytes!);

    final Map<String, dynamic> evento = {
      "nombre": nombreController.text,
      "descripcion": descripcionController.text,
      "lugar": lugarController.text,
      "fecha_inicio": fechaInicioController.text,
      "fecha_termino": fechaTerminoController.text,
      "hora_inicio": horaInicioController.text,
      "hora_termino": horaTerminoController.text,
      "profesor_id": profesorIdController.text,
      "imagen": imagenBase64,
    };

    try {
      final response = await http.post(
        Uri.parse('https://escolares.free.beeceptor.com'), // tu endpoint
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(evento),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("JSON enviado correctamente!");
      } else {
        print("Error al enviar JSON: ${response.statusCode}");
      }
    } catch (e) {
      print("Error al enviar JSON: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Imagen de encabezado
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 60),
              child: Image.asset(
                'assets/header.jpg',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 80),

            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                constraints: const BoxConstraints(maxWidth: 600),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 40,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Registrar Evento',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'TimesNewRoman',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Nombre del evento
                    const Text(
                      'Nombre del evento',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'TimesNewRoman',
                        color: Color(0xFF71B6A7),
                      ),
                    ),
                    TextField(
                      controller: nombreController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF71B6A7), width: 2.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Descripción
                    const Text(
                      'Descripción',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'TimesNewRoman',
                        color: Color(0xFF71B6A7),
                      ),
                    ),
                    TextField(
                      controller: descripcionController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF71B6A7), width: 2.0),
                        ),
                      ),
                      maxLines: 4,
                    ),
                    const SizedBox(height: 16),

                    // Lugar
                    const Text(
                      'Lugar del evento',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'TimesNewRoman',
                        color: Color(0xFF71B6A7),
                      ),
                    ),
                    TextField(
                      controller: lugarController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF71B6A7), width: 2.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Fecha inicio
                    const Text(
                      'Fecha de inicio',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'TimesNewRoman',
                        color: Color(0xFF71B6A7),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: fechaInicioController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        hintText: 'DD/MM/AAAA',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF71B6A7), width: 2.0),
                        ),
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      onTap: () async {
                        DateTime? fechaSeleccionada = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );

                        if (fechaSeleccionada != null) {
                          fechaInicioController.text =
                          "${fechaSeleccionada.day.toString().padLeft(2, '0')}/"
                              "${fechaSeleccionada.month.toString().padLeft(2, '0')}/"
                              "${fechaSeleccionada.year}";
                        }
                      },
                    ),
                    const SizedBox(height: 16),

                    // Fecha término
                    const Text(
                      'Fecha de término',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'TimesNewRoman',
                        color: Color(0xFF71B6A7),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: fechaTerminoController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        hintText: 'DD/MM/AAAA',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF71B6A7), width: 2.0),
                        ),
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      onTap: () async {
                        DateTime? fechaSeleccionada = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );

                        if (fechaSeleccionada != null) {
                          fechaTerminoController.text =
                          "${fechaSeleccionada.day.toString().padLeft(2, '0')}/"
                              "${fechaSeleccionada.month.toString().padLeft(2, '0')}/"
                              "${fechaSeleccionada.year}";
                        }
                      },
                    ),
                    const SizedBox(height: 16),

                    // Hora inicio
                    const Text(
                      'Hora de inicio',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'TimesNewRoman',
                        color: Color(0xFF71B6A7),
                      ),
                    ),
                    TextField(
                      controller: horaInicioController,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'HH:MM',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF71B6A7), width: 2.0),
                        ),
                        suffixIcon: const Icon(Icons.access_time),
                      ),
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (pickedTime != null) {
                          horaInicioController.text =
                              pickedTime.format(context);
                        }
                      },
                    ),
                    const SizedBox(height: 16),

                    // Hora término
                    const Text(
                      'Hora de termino',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'TimesNewRoman',
                        color: Color(0xFF71B6A7),
                      ),
                    ),
                    TextField(
                      controller: horaTerminoController,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'HH:MM',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF71B6A7), width: 2.0),
                        ),
                        suffixIcon: const Icon(Icons.access_time),
                      ),
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (pickedTime != null) {
                          horaTerminoController.text =
                              pickedTime.format(context);
                        }
                      },
                    ),
                    const SizedBox(height: 16),

                    // ID Profesor
                    const Text(
                      'ID del profesor',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'TimesNewRoman',
                        color: Color(0xFF71B6A7),
                      ),
                    ),
                    TextField(
                      controller: profesorIdController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF71B6A7), width: 2.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Selección de imagen
                    const Text(
                      'Imagen del evento',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'TimesNewRoman',
                        color: Color(0xFF71B6A7),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Column(
                        children: [
                          if (imagenBytes != null)
                            Image.memory(
                              imagenBytes!,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            )
                          else
                            Container(
                              width: 200,
                              height: 200,
                              color: Colors.grey[300],
                              child: const Icon(Icons.image, size: 50),
                            ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: seleccionarImagen,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF71B6A7),
                              foregroundColor: Colors.white, // Esto hace que el texto sea blanco
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Mayor tamaño
                              textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            child: const Text('Seleccionar Imagen'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Botón Guardar
                    ElevatedButton(
                      onPressed: enviarEventoMock,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF71B6A7),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Guardar Evento'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
