import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: LongTapPage(),
  ));
}

class LongTapPage extends StatelessWidget {
  const LongTapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Long Tap'),
      ),
      body: Center(
        child: GestureDetector(
          onLongPress: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Long Tap Detected'),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(30),
            color: Colors.orange,
            child: const Text(
              'Long Press Me',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}