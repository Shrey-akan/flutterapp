import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  // Validation function for name
  String? validateName(String? value) {
    // Only allow alphabets and space in the name
    if (value == null || value.isEmpty) {
      return 'Name is required';
    } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
      return 'Please enter a valid name (only alphabets and spaces)';
    }
    return null;
  }

  // Validation function for email
  String? validateEmail(String? value) {
    // Ensure the email ends with @gmail.com
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!value.endsWith('@gmail.com')) {
      return 'Please Enter a Valid Email Address';
    }
    return null;
  }

  // Validation function for phone number
  String? validatePhone(String? value) {
    // Ensure the phone number is 10 digits
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    } else if (value.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Please Enter a Valid 10-digits Phone Number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Add your form fields or input widgets for editing profile information
              // For example:
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: validateName,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'New Job Title'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: validateEmail,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone'),
                validator: validatePhone,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add logic to save edited profile information
                  if (Form.of(context).validate()) {
                    // Form is valid, save the changes
                    // You can add logic to save the changes here
                  }
                },
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
