import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:jobmobapp/src/register/register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Future<void> loginUser(BuildContext context, String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('https://job4jobless.com:9001/logincheck'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'userName': username,
          'userPassword': password,
        }),
      );

      if (response.statusCode == 200) {
        // Successful login
        print('Login successful');

        // Parse the response body and handle the access token and refresh token
        final Map<String, dynamic> responseBody = json.decode(response.body);
        final String accessToken = responseBody['accessToken'];
        final String refreshToken = responseBody['refreshToken'];

        // You may want to store these tokens securely for future requests

        // Navigate to the home screen or perform other actions upon successful login
        // For example, you can replace the line below with your navigation logic
        Navigator.pushReplacementNamed(context, '/home');
      } else if (response.statusCode == 401) {
        // Unauthorized (Login failed)
        print('Login failed - Unauthorized');
        // Show an error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid username or password'),
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        // Other error status codes
        print('Login failed - ${response.statusCode}');
        // Handle the error, e.g., show a generic error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('An error occurred. Please try again later.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      // Handle any exceptions that may occur during the HTTP request
      print('An error occurred: $e');
      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred. Please try again later.'),
          duration: Duration(seconds: 3),
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
                loginUser(context, 'user', 'password'); // Replace with actual username and password
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
