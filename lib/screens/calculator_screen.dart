import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/calculator_provider.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.background,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Consumer<CalculatorProvider>(
                        builder: (context, calculator, child) {
                          return Text(
                            calculator.history,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      Consumer<CalculatorProvider>(
                        builder: (context, calculator, child) {
                          return Text(
                            calculator.currentNumber,
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            _buildButton('C', onPressed: () {
                              context.read<CalculatorProvider>().clear();
                            }, isOperator: true),
                            _buildButton('+/-', onPressed: () {
                              context.read<CalculatorProvider>().changeSign();
                            }, isOperator: true),
                            _buildButton('%', onPressed: () {
                              context.read<CalculatorProvider>().percentage();
                            }, isOperator: true),
                            _buildButton('÷', onPressed: () {
                              context.read<CalculatorProvider>().setOperation('÷');
                            }, isOperator: true),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            _buildButton('7'),
                            _buildButton('8'),
                            _buildButton('9'),
                            _buildButton('×', isOperator: true),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            _buildButton('4'),
                            _buildButton('5'),
                            _buildButton('6'),
                            _buildButton('-', isOperator: true),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            _buildButton('1'),
                            _buildButton('2'),
                            _buildButton('3'),
                            _buildButton('+', isOperator: true),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            _buildButton('0', flex: 2),
                            _buildButton('.'),
                            _buildButton('=', isOperator: true),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, {required VoidCallback? onPressed, int flex = 1, bool isOperator = false}) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: onPressed ?? () {
            // Manejo de dígitos numéricos
            if (text != '=' && text != 'C' && text != '+/-' && text != '%' && text != '÷' && text != '×' && text != '-' && text != '+') {
              onPressed?.call();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: isOperator 
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.surface,
            foregroundColor: isOperator 
                ? Theme.of(context).colorScheme.onPrimaryContainer
                : Theme.of(context).colorScheme.onSurface,
            elevation: 4,
            shadowColor: Theme.of(context).colorScheme.shadow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              fontWeight: isOperator ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
} 