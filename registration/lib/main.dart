import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();

  String gender = '';

  bool reading = false;
  bool music = false;
  bool sports = false;

  void submit() {
    String hobbies = '';

    if (reading) hobbies += 'Reading ';
    if (music) hobbies += 'Music ';
    if (sports) hobbies += 'Sports ';

    // Basic validation
    if (nameController.text.isEmpty) {
      showError('Please enter your name');
      return;
    }

    if (emailController.text.isEmpty ||
        !emailController.text.contains('@')) {
      showError('Please enter a valid email');
      return;
    }

    if (mobileController.text.length != 10) {
      showError('Please enter a valid 10-digit mobile number');
      return;
    }

    if (gender.isEmpty) {
      showError('Please select gender');
      return;
    }

    if (hobbies.isEmpty) {
      showError('Please select at least one hobby');
      return;
    }

    // Display details
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Registration Details'),
          content: Text(
            'Name: ${nameController.text}\n'
                'Email: ${emailController.text}\n'
                'Mobile: ${mobileController.text}\n'
                'Gender: $gender\n'
                'Hobbies: $hobbies',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            // Name
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            // Email
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email ID',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            // Mobile
            TextField(
              controller: mobileController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Mobile No',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            // Gender
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Gender'),
            ),

            Row(
              children: [
                Radio(
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                const Text('Male'),

                Radio(
                  value: 'Female',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                const Text('Female'),
              ],
            ),

            // Hobbies
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Hobbies'),
            ),

            CheckboxListTile(
              title: const Text('Reading'),
              value: reading,
              onChanged: (value) {
                setState(() {
                  reading = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text('Music'),
              value: music,
              onChanged: (value) {
                setState(() {
                  music = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text('Sports'),
              value: sports,
              onChanged: (value) {
                setState(() {
                  sports = value!;
                });
              },
            ),

            // Submit
            ElevatedButton(
              onPressed: submit,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}