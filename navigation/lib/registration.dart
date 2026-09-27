import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() =>
      _RegistrationPageState();
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

    if (nameController.text.isEmpty) {
      showMessage('Please enter your name');
      return;
    }

    if (emailController.text.isEmpty ||
        !emailController.text.contains('@')) {
      showMessage('Please enter a valid email');
      return;
    }

    if (mobileController.text.length != 10) {
      showMessage('Please enter a valid mobile number');
      return;
    }

    if (gender.isEmpty) {
      showMessage('Please select gender');
      return;
    }

    if (hobbies.isEmpty) {
      showMessage('Please select at least one hobby');
      return;
    }

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

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const Text(
              'Registration',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email ID',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: mobileController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Mobile No',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Gender',
                style: TextStyle(fontSize: 16),
              ),
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

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hobbies',
                style: TextStyle(fontSize: 16),
              ),
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

            const SizedBox(height: 10),

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