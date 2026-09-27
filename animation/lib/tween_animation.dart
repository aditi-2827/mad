import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: TweenAnimation(),
  ));
}

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  bool animate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tween Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: 50,
                end: animate ? 200 : 50,
              ),
              duration: const Duration(seconds: 1),
              builder: (context, value, child) {
                return Container(
                  width: value,
                  height: value,
                  color: Colors.orange,
                );
              },
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  animate = !animate;
                });
              },
              child: const Text('Animate'),
            ),
          ],
        ),
      ),
    );
  }
}