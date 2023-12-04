// lib/src/register/register.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  // Validate name with alphabets only
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                    return 'Enter a valid name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  // Validate email with '@gmail.com'
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  if (!value.endsWith('@gmail.com')) {
                    return 'Enter a valid Gmail address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  // Validate password with 8 characters and special character
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  if (value.length < 8 || !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                    return 'Enter a valid password with at least 8 characters and a special character';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // If the form is valid, perform registration logic
                    print('Registration button pressed');
                  }
                },
                child: const Text('Register'),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  // Add your logic for Google login
                  print('Google button pressed');
                },
                child: SvgPicture.asset(
                'assets/google_icon.svg', // Replace with your Google SVG icon path
                height: 40,
                width: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
