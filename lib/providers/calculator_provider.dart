import 'package:flutter/foundation.dart';

class CalculatorProvider with ChangeNotifier {
  String _currentNumber = '0';
  String _history = '';
  String _operation = '';
  double _firstNumber = 0;
  bool _isNewNumber = true;
  double? _lastNumber;
  String? _lastOperation;
  bool _isRepeating = false;

  String get currentNumber => _currentNumber;
  String get history => _history;
  bool get isRepeating => _isRepeating;
  String? get lastOperation => _lastOperation;
  double? get lastNumber => _lastNumber;

  void addDigit(String digit) {
    if (_isNewNumber) {
      _currentNumber = digit;
      _isNewNumber = false;
      _isRepeating = false;
    } else {
      if (digit == '.' && _currentNumber.contains('.')) return;
      _currentNumber += digit;
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
    _isRepeating = false;
    notifyListeners();
  }

  void calculate() {
    if (_operation.isEmpty && !_isRepeating) {
      return;
    }

    double secondNumber = double.parse(_currentNumber);
    double result = 0;

    if (_isRepeating && _lastOperation != null && _lastNumber != null) {
      // Usar la última operación y número para la repetición
      switch (_lastOperation) {
        case '+':
          result = _firstNumber + _lastNumber!;
          break;
        case '-':
          result = _firstNumber - _lastNumber!;
          break;
        case '×':
          result = _firstNumber * _lastNumber!;
          break;
        case '÷':
          if (_lastNumber != 0) {
            result = _firstNumber / _lastNumber!;
          } else {
            _currentNumber = 'Error';
            _history = '';
            _operation = '';
            _isNewNumber = true;
            _isRepeating = false;
            notifyListeners();
            return;
          }
          break;
      }
      _history = '$_firstNumber $_lastOperation $_lastNumber =';
    } else {
      // Operación normal
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
          if (secondNumber != 0) {
            result = _firstNumber / secondNumber;
          } else {
            _currentNumber = 'Error';
            _history = '';
            _operation = '';
            _isNewNumber = true;
            _isRepeating = false;
            notifyListeners();
            return;
          }
          break;
      }
      _history = '$_firstNumber $_operation $secondNumber =';
      // Guardar la última operación y número para repetición
      _lastOperation = _operation;
      _lastNumber = secondNumber;
    }

    _currentNumber = result.toString();
    if (_currentNumber.endsWith('.0')) {
      _currentNumber = _currentNumber.substring(0, _currentNumber.length - 2);
    }
    _firstNumber = result;
    _isNewNumber = true;
    _isRepeating = true;
    notifyListeners();
  }

  void clear() {
    _currentNumber = '0';
    _history = '';
    _operation = '';
    _firstNumber = 0;
    _isNewNumber = true;
    _isRepeating = false;
    _lastOperation = null;
    _lastNumber = null;
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