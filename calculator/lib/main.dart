import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Calculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();

  String operation = '+';
  String result = '';

  void calculate() {
    double a = double.parse(num1Controller.text);
    double b = double.parse(num2Controller.text);

    double answer;

    if (operation == '+') {
      answer = a + b;
    } else if (operation == '-') {
      answer = a - b;
    } else if (operation == '×') {
      answer = a * b;
    } else {
      answer = a / b;
    }

    setState(() {
      result = answer.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Calculator'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'First Number',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: num2Controller,
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
                  onPressed: () => operation = '+',
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => operation = '-',
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => operation = '×',
                  child: const Text('×'),
                ),
                ElevatedButton(
                  onPressed: () => operation = '÷',
                  child: const Text('÷'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calculate,
              child: const Text('Submit'),
            ),

            const SizedBox(height: 20),

            Text(
              'Result: $result',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}