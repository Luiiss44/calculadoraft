import 'package:flutter/foundation.dart';

class CalculatorProvider extends ChangeNotifier {
  String _currentNumber = '0';
  String _operation = '';
  double _firstNumber = 0;
  bool _isNewNumber = true;
  String _history = '';

  String get currentNumber => _currentNumber;
  String get history => _history;

  void addDigit(String digit) {
    if (_isNewNumber) {
      _currentNumber = digit;
      _isNewNumber = false;
    } else {
      if (_currentNumber == '0' && digit != '.') {
        _currentNumber = digit;
      } else {
        if (digit == '.' && _currentNumber.contains('.')) return;
        _currentNumber += digit;
      }
    }
    notifyListeners();
  }

  void setOperation(String operation) {
    if (_operation.isNotEmpty && !_isNewNumber) {
      calculate();
    }
    _firstNumber = double.parse(_currentNumber);
    _operation = operation;
    _history = '$_firstNumber $_operation';
    _isNewNumber = true;
    notifyListeners();
  }

  void calculate() {
    if (_operation.isEmpty) return;

    double secondNumber = double.parse(_currentNumber);
    double result = 0;

    switch (_operation) {
      case '+':
        result = _firstNumber + secondNumber;
        break;
      case '-':
        result = _firstNumber - secondNumber;
        break;
      case '×':
        result = _firstNumber * secondNumber;
        break;
      case '÷':
        if (secondNumber == 0) {
          _currentNumber = 'Error';
          _operation = '';
          _isNewNumber = true;
          notifyListeners();
          return;
        }
        result = _firstNumber / secondNumber;
        break;
      case '%':
        result = _firstNumber % secondNumber;
        break;
    }

    _history = '$_firstNumber $_operation $secondNumber =';
    _currentNumber = result.toString();
    if (_currentNumber.endsWith('.0')) {
      _currentNumber = _currentNumber.substring(0, _currentNumber.length - 2);
    }
    _operation = '';
    _isNewNumber = true;
    notifyListeners();
  }

  void clear() {
    _currentNumber = '0';
    _operation = '';
    _firstNumber = 0;
    _isNewNumber = true;
    _history = '';
    notifyListeners();
  }

  void changeSign() {
    if (_currentNumber != '0') {
      if (_currentNumber.startsWith('-')) {
        _currentNumber = _currentNumber.substring(1);
      } else {
        _currentNumber = '-$_currentNumber';
      }
      notifyListeners();
    }
  }

  void percentage() {
    double number = double.parse(_currentNumber);
    _currentNumber = (number / 100).toString();
    if (_currentNumber.endsWith('.0')) {
      _currentNumber = _currentNumber.substring(0, _currentNumber.length - 2);
    }
    notifyListeners();
  }
} 