import 'package:flutter/material.dart'; //Importa el toolkit UI de Flutter

class RegisterScreen extends StatelessWidget { //Pantalla sin estado (Stateless)
  const RegisterScreen({super.key}); //Constructor con key opcional

  @override
  Widget build(BuildContext context) { //Método principal de renderizado

    //Controladores para leer el texto ingresado
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold( //Estructura general de la pantalla
      appBar: AppBar(
        title: const Text('Register'), //Título en la barra superior
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), //Margen alrededor del contenido
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, //Que los hijos ocupen todo el ancho
          children: [

            const Text(
              'Create your account', //Título grande
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32), //Espacio vertical

            //Nombre
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),

            const SizedBox(height: 16),

            //Email
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 16),

            //Contraseña
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),

            const SizedBox(height: 16),

            //Repetir contraseña
            TextField(
              controller: confirmPasswordController,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),

            const SizedBox(height: 24),

            //Botón de registrar
            ElevatedButton(
              onPressed: () {
                // TODO: añadir lógica de registro
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Register button pressed')),
                );
              },
              child: const Text('Register'),
            ),

            const SizedBox(height: 12),

            // Enlace para ir a Login
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Already have an account? Log in'),
            ),
          ],
        ),
      ),
    );
  }
}
