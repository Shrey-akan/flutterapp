import 'package:flutter/material.dart';
import 'edit_profile.dart'; // Import the EditProfilePage

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/avtar.webp'), // Add your image asset path
            ),
            const SizedBox(height: 20),
            const Text(
              'XYX',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Software Developer',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Card(
              elevation: 3,
              child: ListTile(
                title: Text('Email'),
                subtitle: Text('xyz.doe@example.com'),
                leading: Icon(Icons.email),
              ),
            ),
            const Card(
              elevation: 3,
              child: ListTile(
                title: Text('Phone'),
                subtitle: Text('+91-9784063135'),
                leading: Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the EditProfilePage when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfilePage()),
                );
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
