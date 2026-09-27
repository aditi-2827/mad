import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MovePage(),
  ));
}

class MovePage extends StatefulWidget {
  const MovePage({super.key});

  @override
  State<MovePage> createState() => _MovePageState();
}

class _MovePageState extends State<MovePage> {
  double x = 100;
  double y = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Move Anywhere'),
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            x += details.delta.dx;
            y += details.delta.dy;
          });
        },
        child: Stack(
          children: [
            Positioned(
              left: x,
              top: y,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'Move Me',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}