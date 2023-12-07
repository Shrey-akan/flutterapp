import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:jobmobapp/src/landing/landing_page.dart';
import 'dart:convert';

import 'package:jobmobapp/src/register/register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Future<void> loginUser(
      BuildContext context, String username, String password) async {
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

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        final String accessToken = responseBody['accessToken'] ?? '';
        final String refreshToken = responseBody['refreshToken'] ?? '';
        var uid = responseBody['uid'] ?? '';
        
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LandingPage(
              accessToken: accessToken,
              refreshToken: refreshToken,
              isUserLoggedIn: true,
              uid: uid,
            ),
          ),
        );
      } else if (response.statusCode == 401) {
        print('Login failed - Unauthorized');

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid username or password'),
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        print('Login failed - ${response.statusCode}');

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('An error occurred checking . Please try again later.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      print('An error occurred: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred check. Please try again later.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String username = '';
    String password = '';

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
              onChanged: (value) {
                username = value;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (username.isNotEmpty && password.isNotEmpty) {
                  loginUser(context, username, password);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter both username and password'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 16),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                print('Google login button pressed');
              },
              child: SvgPicture.asset(
                'assets/google_icon.svg',
                height: 40,
                width: 40,
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                print('Google login button pressed');
              },
              child: Image.asset(
                'assets/icon/google_icon.png',
                height: 40,
                width: 40,
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
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
