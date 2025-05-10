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
            seedColor: const Color(0xFF6750A4),
            brightness: Brightness.light,
            primary: const Color(0xFF6750A4),
            secondary: const Color(0xFF625B71),
            tertiary: const Color(0xFF7D5260),
            background: const Color(0xFFFFFBFE),
            surface: const Color(0xFFFFFBFE),
            primaryContainer: const Color(0xFFEADDFF),
            secondaryContainer: const Color(0xFFE8DEF8),
          ),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFD0BCFF),
            brightness: Brightness.dark,
            primary: const Color(0xFFD0BCFF),
            secondary: const Color(0xFFCCC2DC),
            tertiary: const Color(0xFFEFB8C8),
            background: const Color(0xFF1C1B1F),
            surface: const Color(0xFF1C1B1F),
            primaryContainer: const Color(0xFF4F378B),
            secondaryContainer: const Color(0xFF4A4458),
          ),
          useMaterial3: true,
        ),
        home: const CalculatorScreen(),
      ),
    );
  }
}
