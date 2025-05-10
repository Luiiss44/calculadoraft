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
              Theme
                  .of(context)
                  .colorScheme
                  .primaryContainer,
              Theme
                  .of(context)
                  .colorScheme
                  .surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .surface,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .shadow
                              .withOpacity(0.2),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Consumer<CalculatorProvider>(
                          builder: (context, calculator, child) {
                            return Text(
                              calculator.history,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.6),
                                fontSize: 24,
                                height: 1.2,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        Consumer<CalculatorProvider>(
                          builder: (context, calculator, child) {
                            return Text(
                              calculator.currentNumber,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .onSurface,
                                fontWeight: FontWeight.bold,
                                fontSize: 56,
                                height: 1.1,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4, vertical: 8),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              _buildButton(context, 'C', onPressed: () {
                                context.read<CalculatorProvider>().clear();
                              }, isOperator: true),
                              _buildButton(context, '±', onPressed: () {
                                context.read<CalculatorProvider>().changeSign();
                              }, isOperator: true),
                              _buildButton(context, '%', onPressed: () {
                                context.read<CalculatorProvider>().percentage();
                              }, isOperator: true),
                              _buildButton(context, '÷', onPressed: () {
                                context.read<CalculatorProvider>().setOperation(
                                    '÷');
                              }, isOperator: true),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              _buildButton(context, '7', onPressed: () {
                                context.read<CalculatorProvider>().addDigit(
                                    '7');
                              }),
                              _buildButton(context, '8', onPressed: () {
                                context.read<CalculatorProvider>().addDigit(
                                    '8');
                              }),
                              _buildButton(context, '9', onPressed: () {
                                context.read<CalculatorProvider>().addDigit(
                                    '9');
                              }),
                              _buildButton(context, '×', onPressed: () {
                                context.read<CalculatorProvider>().setOperation(
                                    '×');
                              }, isOperator: true),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              _buildButton(context, '4', onPressed: () {
                                context.read<CalculatorProvider>().addDigit(
                                    '4');
                              }),
                              _buildButton(context, '5', onPressed: () {
                                context.read<CalculatorProvider>().addDigit(
                                    '5');
                              }),
                              _buildButton(context, '6', onPressed: () {
                                context.read<CalculatorProvider>().addDigit(
                                    '6');
                              }),
                              _buildButton(context, '-', onPressed: () {
                                context.read<CalculatorProvider>().setOperation(
                                    '-');
                              }, isOperator: true),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              _buildButton(context, '1', onPressed: () {
                                context.read<CalculatorProvider>().addDigit(
                                    '1');
                              }),
                              _buildButton(context, '2', onPressed: () {
                                context.read<CalculatorProvider>().addDigit(
                                    '2');
                              }),
                              _buildButton(context, '3', onPressed: () {
                                context.read<CalculatorProvider>().addDigit(
                                    '3');
                              }),
                              _buildButton(context, '+', onPressed: () {
                                context.read<CalculatorProvider>().setOperation(
                                    '+');
                              }, isOperator: true),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              _buildButton(context, '0', onPressed: () {
                                context.read<CalculatorProvider>().addDigit(
                                    '0');
                              }, flex: 2),
                              _buildButton(context, '.', onPressed: () {
                                context.read<CalculatorProvider>().addDigit(
                                    '.');
                              }),
                              _buildButton(context, '=', onPressed: () {
                                context.read<CalculatorProvider>().calculate();
                              }, isOperator: true),
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
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      String text, {
        required VoidCallback onPressed,
        int flex = 1,
        bool isOperator = false,
      }) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Material(
          color: isOperator
              ? Theme
              .of(context)
              .colorScheme
              .primary
              : Theme
              .of(context)
              .colorScheme
              .surface,
          elevation: 2,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(20),
            splashColor: Theme
                .of(context)
                .colorScheme
                .secondary
                .withOpacity(0.2),
            highlightColor: Colors.transparent,
            child: Container(
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: isOperator ? FontWeight.bold : FontWeight.w500,
                  color: isOperator
                      ? Theme
                      .of(context)
                      .colorScheme
                      .onPrimary
                      : Theme
                      .of(context)
                      .colorScheme
                      .onSurfaceVariant,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}