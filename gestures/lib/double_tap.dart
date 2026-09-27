import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: DoubleTapPage(),
  ));
}

class DoubleTapPage extends StatelessWidget {
  const DoubleTapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Double Tap'),
      ),
      body: Center(
        child: GestureDetector(
          onDoubleTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Double Tap Detected'),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(30),
            color: Colors.green,
            child: const Text(
              'Double Tap Me',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}