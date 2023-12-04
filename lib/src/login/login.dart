// lib/src/login/login.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobmobapp/src/register/register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add your login logic here
                print('Login button pressed');
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 16),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            const SizedBox(height: 16),
            // Add Google icon for social login using SvgPicture
            InkWell(
              onTap: () {
                // Add your Google login logic here
                print('Google login button pressed');
              },
              child: SvgPicture.asset(
                'assets/google_icon.svg', // Replace with your Google SVG icon path
                height: 40,
                width: 40,
              ),
            ),
            const SizedBox(height: 16),
            // Add Google icon for social login using Image.asset
            InkWell(
              onTap: () {
                // Add your Google login logic here
                print('Google login button pressed');
              },
              child: Image.asset(
                'assets/icon/google_icon.png', // Replace with your Google icon image path
                height: 40,
                width: 40,
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Navigate to the registration page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: const Text('Create an account'),
            ),
          ],
        ),
      ),
    );
  }
}
