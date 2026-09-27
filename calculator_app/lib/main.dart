import 'package:flutter/material.dart';
import 'package:cal_package/cal_package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final firstController = TextEditingController();
  final secondController = TextEditingController();

  final Calculator calculator = Calculator();

  String result = '';

  void calculate(String operation) {
    int a = int.parse(firstController.text);
    int b = int.parse(secondController.text);

    try {
      if (operation == '+') {
        result = calculator.add(a, b).toString();
      } else if (operation == '-') {
        result = calculator.subtract(a, b).toString();
      } else if (operation == '*') {
        result = calculator.multiply(a, b).toString();
      } else if (operation == '/') {
        result = calculator.divide(a, b).toString();
      }

      setState(() {});
    } catch (e) {
      setState(() {
        result = 'Cannot divide by zero';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: firstController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'First Number',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: secondController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Second Number',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => calculate('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => calculate('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => calculate('*'),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => calculate('/'),
                  child: const Text('/'),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Text(
              'Result: $result',
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}