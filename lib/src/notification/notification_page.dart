// lib/notification/notification_page.dart
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            title: Text('Notification Option 1'),
            subtitle: Text('Configure notification option 1'),
            // Add onTap handler for this option
          ),
          ListTile(
            title: Text('Notification Option 2'),
            subtitle: Text('Configure notification option 2'),
            // Add onTap handler for this option
          ),
          // Add more notification options as needed
        ],
      ),
    );
  }
}
