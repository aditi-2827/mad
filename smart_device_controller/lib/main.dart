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
      home: const SmartDevicePage(),
    );
  }
}

class SmartDevicePage extends StatefulWidget {
  const SmartDevicePage({super.key});

  @override
  State<SmartDevicePage> createState() => _SmartDevicePageState();
}

class _SmartDevicePageState extends State<SmartDevicePage> {

  // Device names
  List<String> devices = [
    'Smart Bulb',
    'Smart Fan',
    'Air Conditioner',
    'Smart TV',
    'Smart Speaker',
  ];

  // Selected devices
  List<bool> selected = [
    true,
    true,
    false,
    true,
    false,
  ];

  // Power ON/OFF
  List<bool> power = [
    true,
    true,
    false,
    false,
    false,
  ];

  // Brightness
  List<double> brightness = [
    60,
    60,
    20,
    20,
    20,
  ];

  void submit() {

    String result = '';

    for (int i = 0; i < devices.length; i++) {

      if (selected[i]) {
        result +=
        '${devices[i]}\n'
            'Power: ${power[i] ? "ON" : "OFF"}\n'
            'Brightness: ${brightness[i].round()}%\n\n';
      }
    }

    if (result.isEmpty) {
      result = 'No device selected';
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Selected Devices'),
          content: Text(result),
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
        title: const Text('Smart Device Controller'),
      ),

      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),

              itemCount: devices.length,

              itemBuilder: (context, index) {

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),

                    child: Column(
                      children: [

                        // Device selection
                        Row(
                          children: [

                            Checkbox(
                              value: selected[index],

                              onChanged: (value) {
                                setState(() {
                                  selected[index] = value!;
                                });
                              },
                            ),

                            Text(
                              devices[index],
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),

                        // Show controls only for selected device
                        if (selected[index]) ...[

                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,

                            children: [

                              const Text('Power'),

                              Switch(
                                value: power[index],

                                onChanged: (value) {
                                  setState(() {
                                    power[index] = value;
                                  });
                                },
                              ),
                            ],
                          ),

                          // Brightness
                          Row(
                            children: [

                              Text(
                                'Brightness: '
                                    '${brightness[index].round()}%',
                              ),
                            ],
                          ),

                          Slider(
                            value: brightness[index],

                            min: 0,
                            max: 100,

                            onChanged: (value) {
                              setState(() {
                                brightness[index] = value;
                              });
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Submit button
          Padding(
            padding: const EdgeInsets.all(15),

            child: SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: submit,

                child: const Text('Apply'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}