import 'package:flutter/material.dart';

class CookiesPage extends StatelessWidget {
  const CookiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cookies'),
      ),
      body: const Center(
        child: Text('Cookie Policy'),
      ),
    );
  }
}
