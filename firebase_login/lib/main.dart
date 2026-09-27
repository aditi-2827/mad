//Step 1 — Create Firebase project
//open firebase console - https://console.firebase.google.com/u/0/
//sign in with your google account > click create a project > name it - login-app > click continue > click create project

//step 2 - enable email/password
//inside your firebase project > security > authentication > go to sign in methods > email/password > turn enable ON > click save

//then create flutter project -- no need to create you already have
//terminal run > flutter pub add firebase_core
//then run > flutter pub add firebase_auth

//step 3 - Register Android app
//Go back to Firebase Console → Project Overview > add app > Android
//package name - com.example.firebase_login
//you'll get this in android > app > build.gradle.kts > applicationId
//download your own google-services.json
//delete the existing google-services.json from android > app
//put your downloaded google-services.json inside android > app

//step 4 - Add Firebase SDK
//open android > build.gradle.kts
//inside plugins { } add:
//id("com.google.gms.google-services") version "4.5.0" apply false

//then open android > app > build.gradle.kts
//inside plugins { } add:
//id("com.google.gms.google-services")

//step 5 - Install Firebase CLI
//check in terminal:
//firebase --version
//if not installed, install Firebase CLI

//then login:
//firebase login
//sign in with the same Google account used for Firebase

//step 6 - Install FlutterFire CLI
//terminal:
//dart pub global activate flutterfire_cli

//if flutterfire command is not recognized, use:
//dart pub global run flutterfire_cli:flutterfire configure

//step 7 - Connect Flutter project with Firebase
//inside your firebase_login project folder run:
//flutterfire configure

//select your Firebase project - login-app
//select Android
//select Web if you also want to run the project in Chrome

//this automatically creates:
//lib > firebase_options.dart

//step 8 - Initialize Firebase
//open lib > main.dart
//add:

//import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

//void main() async {
//  WidgetsFlutterBinding.ensureInitialized();

//  await Firebase.initializeApp(
//    options: DefaultFirebaseOptions.currentPlatform,
//  );

//  runApp(const MyApp());
//}

//step 9 - Test Firebase connection
//terminal:
//flutter clean
//flutter pub get
//flutter run

//if the app runs without Firebase error, Firebase is connected successfully

//step 10 - Create a Firebase user
//Firebase Console > Authentication > Users > Add user
//enter email and password > click Add user

//step 11 - Create login page
//use TextField for email
//use TextField for password
//use ElevatedButton for Login

//login button uses:
//FirebaseAuth.instance.signInWithEmailAndPassword(
//  email: emailController.text,
//  password: passwordController.text,
//)

//if login is correct > show "Login Successful"
//if login is wrong > show SnackBar "Invalid email or password"



import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Successful'),
        ),
      );

    } on FirebaseAuthException catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message ?? 'Login Failed',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              'Login',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

//flutter pub get
// flutter run