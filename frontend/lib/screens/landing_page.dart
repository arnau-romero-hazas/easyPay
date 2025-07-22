import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('easyPay'),
      ),
      body: Center(
              child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        child: const Text('Go to Login'),
      ),
      ),
    );
  }
}
