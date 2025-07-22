import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> handleLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      final messenger = ScaffoldMessenger.of(context); // capturado antes del await
      messenger.showSnackBar(
        const SnackBar(content: Text('Email and password required')),
      );
      return;
    }

    // Captura del contexto antes del await
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/api/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
    
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final token = responseData['user']['token'];
        final username = responseData['user']['username'];

        // Guardar token y username en almacenamiento local
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        await prefs.setString('username', username);

        messenger.showSnackBar(
          const SnackBar(content: Text('Login successful')),
        );

       if (!mounted) return;

      if (response.statusCode == 200) {
        navigator.pushReplacementNamed('/home', arguments: username);
      }
      } else {
        final error = jsonDecode(response.body)['error'] ?? 'Login failed';
        messenger.showSnackBar(
          SnackBar(content: Text('Error: $error')),
        );
      }
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text('Network error: $e')),
      );
    }
  }

 @override
  Widget build(BuildContext context) {
    final Color backgroundStart = const Color(0xFFFFF9E6);
    final Color backgroundEnd = const Color(0xFFFFF5D1);
    final Color primaryButtonColor = const Color(0xFFFDD835);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [backgroundStart, backgroundEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Login to Bondy',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4A4A4A),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryButtonColor,
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 6,
                      shadowColor: primaryButtonColor.withAlpha((0.5 * 255).round()),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/register'),
                  child: const Text('Don’t have an account? Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}