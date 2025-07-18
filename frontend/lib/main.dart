import 'package:flutter/material.dart'; // Core Flutter UI framework
import 'screens/home_screen.dart';  
import 'screens/login_screen.dart';     // ⬅️ nueva línea
import 'screens/register_screen.dart';    // Our custom home screen

void main() {
  runApp(const EasyPayApp()); // Entry point of the app
}

class EasyPayApp extends StatelessWidget {
  const EasyPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'easyPay', // App name (used internally)
      debugShowCheckedModeBanner: false, // Removes the debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), // App color theme
        useMaterial3: true, // Enables Material 3 styling
      ),
      initialRoute: '/', // Sets the initial route
      routes: {
        '/': (context) => const HomeScreen(), // Route to HomeScreen
         '/login': (context) => const LoginScreen(),       
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
