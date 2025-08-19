import 'package:flutter/material.dart';
import 'event_form_view.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> actividades = [
    {
      'titulo': 'Convocatoria Nuevo Ingreso a Licenciaturas 2025',
      'descripcion': 'Del 14 de Febrero al 25 de Junio'
    },
    {
      'titulo': 'Batalla de Ingenieros UNPA 2025',
      'descripcion': 'Competencia académica entre programas de ingeniería'
    },
    {
      'titulo': 'Curso Santander: Teaching with Purpose',
      'descripcion': 'Desarrollo de habilidades en docencia universitaria'
    },
    {
      'titulo': 'Mujeres Indigeneas y Campesinas',
      'descripcion': 'Videoconferencias'
    },
    {
      'titulo': 'Jornadas de ingenierias en diseño',
      'descripcion': '29 y 30 de Mayo 2025'
    },
    {
      'titulo': 'Premios investigacion para jovenes 2025',
      'descripcion': 'Para candidatos al programa de ingeniería en Alemania'
    },
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                'VERANO CIENTÍFICO',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              Image.asset('assets/header.jpg'),
              const SizedBox(height: 10),
              Text(
                'Actualidad',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: actividades.length,
                  itemBuilder: (context, index) {
                    final actividad = actividades[index];
                    return Card(
                      child: ListTile(
                        title: Text(
                          actividad['titulo']!,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          actividad['descripcion']!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Ver más'),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Botón al final
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EventFormView()),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Agregar nueva actividad"),
                ),
              ),
            ],
        ),
    );
  }
}