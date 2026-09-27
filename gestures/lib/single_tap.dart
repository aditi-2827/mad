import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: SingleTapPage(),
  ));
}

class SingleTapPage extends StatelessWidget {
  const SingleTapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Single Tap'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Single Tap Detected'),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(30),
            color: Colors.blue,
            child: const Text(
              'Tap Me',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}