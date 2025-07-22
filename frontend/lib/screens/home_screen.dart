import 'package:flutter/material.dart';  // <-- IMPORTANTE para que funcionen los widgets de Flutter

class HomeScreen extends StatelessWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('easyPay Home')),
      body: Center(child: Text('Welcome, $username!')),
    );
  }
}