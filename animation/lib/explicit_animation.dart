import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ExplicitAnimation(),
  ));
}

class ExplicitAnimation extends StatefulWidget {
  const ExplicitAnimation({super.key});

  @override
  State<ExplicitAnimation> createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    animation = Tween<double>(
      begin: 0,
      end: 300,
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explicit Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(animation.value, 0),
                  child: child,
                );
              },
              child: Container(
                width: 80,
                height: 80,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                controller.forward(from: 0);
              },
              child: const Text('Animate'),
            ),
          ],
        ),
      ),
    );
  }
}