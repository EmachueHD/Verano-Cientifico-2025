import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Event_Form_View.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Map<String, String>> actividades = [];

  @override
  void initState() {
    super.initState();
    _cargarActividadesDesdeAPI();
  }

  // 🔹 Función para traer actividades desde Beeceptor (GET)
  Future<void> _cargarActividadesDesdeAPI() async {
    try {
      final response = await http.get(
        //Uri.parse("https://escolares.free.beeceptor.com/"),
        Uri.parse("http://localhost:8080/api/actividades"),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        final List<Map<String, String>> apiActividades =
        /*data.map<Map<String, String>>((evento) {
          return {
            'titulo': evento['titulo'] as String,
            'descripcion': evento['informacion'] as String,
            'fecha': evento['fecha'] as String,
          };
        }).toList();*/

        data.map<Map<String, String>>((evento) {
          return {
            'titulo': evento['nombre'] as String,
            'descripcion': evento['descripcion'] as String,
            'fecha': evento['fechaInicio'] as String,
          };
        }).toList();

        setState(() {
          actividades.addAll(apiActividades);
        });
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error cargando actividades: $e");
    }
  }

  // 🔹 Función para enviar nueva actividad a Beeceptor (POST)
  Future<void> _enviarActividadABeeceptor(Map<String, String> actividad) async {
    try {
      final response = await http.post(
        Uri.parse("https://escolares.free.beeceptor.com/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(actividad),
      );

      debugPrint("Actividad enviada. Código: ${response.statusCode}");
    } catch (e) {
      debugPrint("Error enviando actividad: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Encabezado
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text(
                  'VERANO CIENTÍFICO',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor,
                  ),
                ),
              ),
            ),

            // Imagen con bordes redondeados
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset('assets/header.jpg'),
              ),
            ),
            const SizedBox(height: 16),

            // Lista de actividades
            Expanded(
              child: actividades.isEmpty
                  ? const Center(
                child: Text(
                  'No hay actividades para mostrar.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
                  : ListView.builder(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 80),
                itemCount: actividades.length,
                itemBuilder: (context, index) {
                  final actividad = actividades[index];
                  return Card(
                    color: theme.cardColor,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            actividad['titulo'] ?? "Sin título",
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.primaryColorDark,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            actividad['descripcion'] ?? "Sin descripción",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Fecha: ${actividad['fecha'] ?? 'No definida'}",
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.primaryColor,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: theme.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Text(
                                      actividad['titulo'] ?? "Sin título",
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          actividad['descripcion'] ??
                                              "Sin descripción",
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "📅 Fecha: ${actividad['fecha'] ?? 'No definida'}",
                                          style: const TextStyle(
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(ctx),
                                        child: const Text("Cerrar"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: const Text(
                                'Ver',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Botón flotante abajo a la derecha
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: theme.primaryColor,
        onPressed: () async {
          final nuevaActividad =
          await Navigator.push<Map<String, String>>(
            context,
            MaterialPageRoute(
              builder: (context) => const EventFormView(),
            ),
          );
          if (nuevaActividad != null) {
            // 👇 CORRECCIÓN: Añade la nueva actividad a la lista local
            // y luego llama a setState para actualizar la UI.
            setState(() {
              actividades.add(nuevaActividad);
            });

            // 👇 Envía la actividad a Beeceptor. Esto es solo para propósitos
            // de registro en la consola de Beeceptor, ya que no guardará los datos.
            await _enviarActividadABeeceptor(nuevaActividad);
          }
        },
        icon: const Icon(Icons.add),
        label: const Text(
          "Agregar actividad",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}