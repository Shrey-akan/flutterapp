// lib/main.dart
import 'package:flutter/material.dart';
import 'src/landing/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indeed Job Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Set the brightness to dark
        brightness: Brightness.dark,
        // Customize other dark theme properties as needed
        hintColor: Colors.cyanAccent,
        // Add more dark theme configurations if necessary
      ),
      home: const LandingPage(accessToken: '', refreshToken: '', isUserLoggedIn: false, uid: '',),
    );
  }
}
