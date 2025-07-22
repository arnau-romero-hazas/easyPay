import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos colores suaves para el fondo y botones
    final Color backgroundStart = const Color(0xFFFFF9E6); // beige claro
    final Color backgroundEnd = const Color(0xFFFFF5D1); // amarillo muy suave
    final Color primaryButtonColor = const Color(0xFFFDD835); // amarillo cálido
    final Color secondaryButtonColor = const Color(0xFFE6DDAA); // beige oscuro para botón secundario

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
                  'Bienvenido a easyPay',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4A4A4A),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                "Este proyecto nace del entusiasmo por unirme al equipo de Bondy y aprender Flutter para aportar valor desde el primer día.\n\n"
                "easyPay es una muestra práctica de cómo aplico arquitectura hexagonal, buenas prácticas de desarrollo y un diseño limpio. He construido funcionalidades reales que reflejan mi forma de trabajar, colaborar y resolver.\n\n"
                "Mi objetivo es que esta app sea una representación auténtica de mi compromiso y profesionalidad, no solo para la entrevista, sino también para crecer junto al equipo.",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6A6A6A),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
                const SizedBox(height: 32),

                // Botón Login
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
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
                      'Iniciar sesión',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Botón Register
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.pushNamed(context, '/register'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: secondaryButtonColor, width: 2),
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Crear cuenta',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
