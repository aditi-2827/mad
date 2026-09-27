import 'dart:io';
import 'package:cal_package/cal_package.dart';

void main() {
  final calculator = Calculator();

  print('--- Calculator ---');

  stdout.write('Enter first number: ');
  int a = int.parse(stdin.readLineSync()!);

  stdout.write('Enter second number: ');
  int b = int.parse(stdin.readLineSync()!);

  stdout.write('Enter operation (+, -, *, /): ');
  String operation = stdin.readLineSync()!;

  try {
    if (operation == '+') {
      print('Result: ${calculator.add(a, b)}');
    } else if (operation == '-') {
      print('Result: ${calculator.subtract(a, b)}');
    } else if (operation == '*') {
      print('Result: ${calculator.multiply(a, b)}');
    } else if (operation == '/') {
      print('Result: ${calculator.divide(a, b)}');
    } else {
      print('Invalid operation');
    }
  } catch (e) {
    print('Error: Cannot divide by zero');
  }
}