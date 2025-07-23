import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart'; // Core Flutter UI framework
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'screens/landing_page.dart';  
import 'screens/login_screen.dart';     
import 'screens/register_screen.dart';    
import 'screens/home_screen.dart';


void main() async{
   WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
    Stripe.publishableKey = 'pk_test_xxx';
    await Stripe.instance.applySettings();
  }
  
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
        '/': (context) => const LandingPage(), // Route to HomeScreen
        '/login': (context) => const LoginScreen(),       
        '/register': (context) => const RegisterScreen(),
        '/home': (context) {
          final username = ModalRoute.of(context)?.settings.arguments as String? ?? 'Guest';
          return HomeScreen(username: username); // Passes username to HomeScreen
        },
      },
      
    );
  }
}
