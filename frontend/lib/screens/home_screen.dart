import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final Color backgroundStart = const Color(0xFFFFF9E6);
    final Color backgroundEnd = const Color(0xFFFFF5D1);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [backgroundStart, backgroundEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha((0.85 * 255).round()),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha((0.08 * 255).round()),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            constraints: const BoxConstraints(maxWidth: 400),
            child: Text(
              'Welcome, $username!',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4A4A4A),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
