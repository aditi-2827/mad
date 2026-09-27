import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ImplicitAnimation(),
  ));
}

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation({super.key});

  @override
  State<ImplicitAnimation> createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  double size = 100;

  void changeSize() {
    setState(() {
      size = size == 100 ? 200 : 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: size,
              height: size,
              color: Colors.blue,
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: changeSize,
              child: const Text('Animate'),
            ),
          ],
        ),
      ),
    );
  }
}