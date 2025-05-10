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
        title: 'Calculator Flutter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2196F3),
            brightness: Brightness.light,
            primary: const Color(0xFF2196F3),
            secondary: const Color(0xFF64B5F6),
            tertiary: const Color(0xFF1976D2),
            surface: const Color(0xFFF5F5F5),
            surfaceVariant: const Color(0xFFE3F2FD),
            primaryContainer: const Color(0xFFBBDEFB),
            secondaryContainer: const Color(0xFFE1F5FE),
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            onSurface: const Color(0xFF1A237E),
            onSurfaceVariant: const Color(0xFF0D47A1),
          ),
          useMaterial3: true,
          cardTheme: CardTheme(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shadowColor: Colors.transparent,
            ),
          ),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2196F3),
            brightness: Brightness.dark,
            primary: const Color(0xFF2196F3),
            secondary: const Color(0xFF64B5F6),
            tertiary: const Color(0xFF1976D2),
            surface: const Color(0xFF121212),
            surfaceVariant: const Color(0xFF1E1E1E),
            primaryContainer: const Color(0xFF0D47A1),
            secondaryContainer: const Color(0xFF1565C0),
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            onSurface: Colors.white,
            onSurfaceVariant: const Color(0xFF90CAF9),
          ),
          useMaterial3: true,
          cardTheme: CardTheme(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shadowColor: Colors.transparent,
            ),
          ),
        ),
        home: const CalculatorScreen(),
      ),
    );
  }
}
