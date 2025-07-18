import 'package:flutter/material.dart'; // Import Flutter UI toolkit

class LoginScreen extends StatelessWidget { // Declare stateless Login screen
  const LoginScreen({super.key}); // Constructor with optional key

  @override
  Widget build(BuildContext context) { // Build method to render UI

    // Create controllers to read text input values
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold( // Scaffold provides basic screen structure
      appBar: AppBar(
        title: const Text('Login'), // Top app bar title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adds padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Make children fill horizontal space
          children: [
            const Text(
              'Welcome back!', // Title text
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32), // Vertical spacing

            TextField(
              controller: emailController, // Connects to controller to read input
              decoration: const InputDecoration(labelText: 'Email'), // Input label
              keyboardType: TextInputType.emailAddress, // Shows email keyboard
            ),

            const SizedBox(height: 16), // Space between fields

            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true, // Hides text (for passwords)
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                // Action when login is pressed (for now, just feedback)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Login button pressed')),
                );
              },
              child: const Text('Log in'),
            ),

            const SizedBox(height: 12),

            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register'); // Navigate to Register screen
              },
              child: const Text("Don't have an account? Register"), // Link text
            ),
          ],
        ),
      ),
    );
  }
}
