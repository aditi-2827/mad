//1. In pubspec.yaml under dependencies: url_launcher: ^6.3.2 --already done just see and do flutter pub get


import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const URLPage(),
    );
  }
}

class URLPage extends StatelessWidget {
  const URLPage({super.key});

  // Function to open Google
  Future<void> openGoogle() async {
    final Uri url = Uri.parse('https://www.google.com');

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('URL Navigation'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Button
            ElevatedButton(
              onPressed: openGoogle,
              child: const Text('Open Google'),
            ),

            const SizedBox(height: 30),

            // Clickable Text
            GestureDetector(
              onTap: openGoogle,
              child: const Text(
                'Go to Google',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}