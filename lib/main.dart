import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/calculator_screen.dart';
import 'providers/calculator_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorProvider(),
      child: MaterialApp(
        title: 'Calculadora Flutter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF4FC3F7),
            brightness: Brightness.light,
            primary: const Color(0xFF4FC3F7),
            secondary: const Color(0xFF81D4FA),
            tertiary: const Color(0xFF29B6F6),
            surface: const Color(0xFFF5F5F5),
            surfaceVariant: const Color(0xFFE0F7FA),
            primaryContainer: const Color(0xFFB3E5FC),
            secondaryContainer: const Color(0xFFE1F5FE),
          ),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF4FC3F7),
            brightness: Brightness.dark,
            primary: const Color(0xFF4FC3F7),
            secondary: const Color(0xFF81D4FA),
            tertiary: const Color(0xFF29B6F6),
            surface: const Color(0xFF1A1A1A),
            surfaceVariant: const Color(0xFF263238),
            primaryContainer: const Color(0xFF01579B),
            secondaryContainer: const Color(0xFF0277BD),
          ),
          useMaterial3: true,
        ),
        home: const CalculatorScreen(),
      ),
    );
  }
}
