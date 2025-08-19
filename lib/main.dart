import 'package:flutter/material.dart';
import 'view/Home_View.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro de Eventos',
      theme: ThemeData(
        primaryColor: const Color(0xFF71B6A7), // color principal
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF71B6A7),   // color de encabezados de pickers
          onPrimary: Colors.white,            // texto de botones de pickers
          onSurface: Colors.black,            // texto dentro del calendario
        ),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF71B6A7), width: 2),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
