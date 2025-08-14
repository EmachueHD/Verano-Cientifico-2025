import 'package:flutter/material.dart';

class EventFormView extends StatelessWidget {
  const EventFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white , // fondo suave para que resalte el recuadro
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
                margin: const EdgeInsets.symmetric(horizontal: 20), // margen externo
                constraints: const BoxConstraints(maxWidth: 600),   // ancho máximo
                padding: const EdgeInsets.all(16),                    // espacio interno
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

                    const Text(
                      'Nombre del evento',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'TimesNewRoman',
                        color: Color(0xFF71B6A7),
                      ),
                    ),

                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF71B6A7), width: 2.0),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Descripción',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'TimesNewRoman',
                        color: Color(0xFF71B6A7),
                      ),
                    ),


                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF71B6A7), width: 2.0),
                        ),
                      ),
                      maxLines: 4,
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Lugar del evento',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'TimesNewRoman',
                        color: Color(0xFF71B6A7),
                      ),
                    ),


                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF71B6A7), width: 2.0),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

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

                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'DD/MM/AAAA',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF71B6A7), width: 2.0),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Fecha de termino',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'TimesNewRoman',
                        color: Color(0xFF71B6A7),
                      ),
                    ),

                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'DD/MM/AAAA',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF71B6A7), width: 2.0),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Hora de inicio',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'TimesNewRoman',
                        color: Color(0xFF71B6A7),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'HH:MM',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF71B6A7), width: 2.0),
                        ),
                        suffixIcon: Icon(Icons.access_time),
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Hora de termino',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'TimesNewRoman',
                        color: Color(0xFF71B6A7),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'HH:MM',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF71B6A7), width: 2.0),
                        ),
                        suffixIcon: Icon(Icons.access_time),
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'ID del profesor',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'TimesNewRoman',
                        color: Color(0xFF71B6A7),
                      ),
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF71B6A7), width: 2.0),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF71B6A7),
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
