import 'package:flutter/material.dart';

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

  // Dentro de _EventFormViewState

  void enviarEventoMock() {
    final Map<String, dynamic> evento = {
      "nombre": nombreController.text,
      "descripcion": descripcionController.text,
      "lugar": lugarController.text,
      "fecha_inicio": fechaInicioController.text,
      "fecha_termino": fechaTerminoController.text,
      "hora_inicio": horaInicioController.text,
      "hora_termino": horaTerminoController.text,
      "profesor_id": profesorIdController.text,
    };

    // Simulamos envío al backend imprimiendo el JSON
    print("Mock enviar evento:");
    print(evento);
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
            // Imagen responsiva arriba
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
                          borderSide: BorderSide(color: Color(0xFF71B6A7), width: 2.0),
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
                          borderSide: BorderSide(color: Color(0xFF71B6A7), width: 2.0),
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
                          borderSide: BorderSide(color: Color(0xFF71B6A7), width: 2.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Fecha inicio
                    const Text(
                      'Fecha de inicio',
                      textAlign: TextAlign.left,
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
                          borderSide: BorderSide(color: Color(0xFF71B6A7), width: 2.0),
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
                      textAlign: TextAlign.left,
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
                          borderSide: BorderSide(color: Color(0xFF71B6A7), width: 2.0),
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
                      readOnly: true, // evita que escriban manualmente
                      decoration: InputDecoration(
                        hintText: 'HH:MM',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF71B6A7), width: 2.0),
                        ),
                        suffixIcon: Icon(Icons.access_time),
                      ),
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (pickedTime != null) {
                          horaInicioController.text =
                              pickedTime.format(context); // llena el TextField
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
                      readOnly: true, // evita que escriban manualmente
                      decoration: InputDecoration(
                        hintText: 'HH:MM',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF71B6A7), width: 2.0),
                        ),
                        suffixIcon: Icon(Icons.access_time),
                      ),
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (pickedTime != null) {
                          horaTerminoController.text =
                              pickedTime.format(context); // llena el TextField
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
                          borderSide: BorderSide(color: Color(0xFF71B6A7), width: 2.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Botón Guardar
                    ElevatedButton(
                      onPressed: () {
                        enviarEventoMock(); // Llama al mock en lugar de enviar a backend real
                      },
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
