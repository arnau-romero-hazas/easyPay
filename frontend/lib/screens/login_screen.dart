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
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Welcome back!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            const SizedBox(height: 32),

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
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: handleLogin,
              child: const Text('Login'),
            ),
            const SizedBox(height: 12),

            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/register'),
              child: const Text('Don’t have an account? Register'),
            ),
          ],
        ),
      ),
    );
  }
}
