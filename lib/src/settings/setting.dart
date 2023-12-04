// lib/settings/setting.dart
import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'package:provider/provider.dart'; // Import the provider package
import '../notification/notification_page.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Notification Settings'),
            subtitle: const Text('Configure your notification preferences'),
            onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Account Settings'),
            subtitle: const Text('Manage your account information'),
            onTap: () {
              // Add navigation or action for account settings
            },
          ),
          ListTile(
            title: const Text('Theme Settings'),
            subtitle: const Text('Change the app theme'),
            onTap: () {
              _showThemeDialog(context);
            },
          ),
          // Add more settings options as needed
        ],
      ),
    );
  }

  void _showThemeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Theme'),
          content: Column(
            children: <Widget>[
              ListTile(
                title: const Text('Light Theme'),
                onTap: () {
                  _applyTheme(context, AppTheme.lightTheme);
                },
              ),
              ListTile(
                title: const Text('Dark Theme'),
                onTap: () {
                  _applyTheme(context, AppTheme.darkTheme);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _applyTheme(BuildContext context, ThemeData theme) {
    Navigator.of(context).pop(); // Close the theme dialog
    // Apply the selected theme
    final themeNotifier = context.read<ThemeNotifier>();
    themeNotifier.setTheme(theme);
  }
}

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;

  ThemeNotifier(this._themeData);

  ThemeData getTheme() => _themeData;

  void setTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
}
