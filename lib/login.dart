// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'forgot_password_screen.dart'; // Asegúrate de importar ForgotPasswordScreen
//
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});
//
//   // Controladores para los campos de texto
//   static final TextEditingController _emailController = TextEditingController();
//   static final TextEditingController _passwordController = TextEditingController();
//
//   Future<void> _login(BuildContext context) async {
//     try {
//       // Autenticación de Firebase
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );
//
//       // Navegar a HomePage después del login exitoso (solo si lo requieres)
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Inicio de sesión exitoso')),
//       );
//       print("Inicio de sesión exitoso");
//     } on FirebaseAuthException catch (e) {
//       print("Error al iniciar sesión: ${e.message}");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: ${e.message}')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'LOGIN',
//           style: TextStyle(color: Colors.grey[800]),
//         ),
//         backgroundColor: Colors.black,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: Stack(
//         children: [
//           // Fondo de la imagen
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/interfas.jpg'), // Ruta de tu imagen de fondo
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Contenido sobre el fondo
//           Center(
//             child: Container(
//               padding: EdgeInsets.all(24.0),
//               margin: EdgeInsets.symmetric(horizontal: 30),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 10,
//                     offset: Offset(0, 5),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     'BIENVENIDO A TU SERVICIO ESPINAR',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Iniciar sesión para continuar',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   // Campo de E-mail
//                   TextField(
//                     controller: _emailController,
//                     decoration: InputDecoration(
//                       labelText: 'E-mail',
//                       border: UnderlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   // Campo de Contraseña
//                   TextField(
//                     controller: _passwordController,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       labelText: 'Contraseña',
//                       border: UnderlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(height: 30),
//                   // Botón INGRESAR
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFFB49FF1), // Color del botón
//                       padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                     onPressed: () => _login(context), // Llamada al método de autenticación
//                     child: Text(
//                       'INGRESAR',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   // Texto de "¿Olvidaste tu contraseña?"
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
//                       );
//                     },
//                     child: Text(
//                       '¿OLVIDASTE TU CONTRASEÑA?',
//                       style: TextStyle(
//                         color: Colors.grey[700],
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_espinar/register_screen.dart'; // Si tienes una pantalla de registro
import 'home_page.dart'; // Asegúrate de importar la página HomePage

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Función para manejar el inicio de sesión
  Future<void> _login() async {
    try {
      // Verifica si existe un usuario con ese correo electrónico
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Usuarios')
          .where('email', isEqualTo: _emailController.text)
          .get();

      if (snapshot.docs.isNotEmpty) {
        DocumentSnapshot userDoc = snapshot.docs.first;

        // Aquí verificamos la contraseña directamente
        String storedPassword = userDoc['password']; // Contraseña almacenada

        // Compara la contraseña ingresada con la almacenada
        if (_passwordController.text.trim() == storedPassword) {
          // Si la contraseña es correcta
          print('Nombre del usuario: ${userDoc['username']}');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Inicio de sesión exitoso'),
          ));

          // Navegar a la pantalla HomePage al iniciar sesión
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          // Contraseña incorrecta
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Contraseña incorrecta'),
          ));
        }
      } else {
        // Usuario no encontrado
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Usuario no encontrado'),
        ));
      }
    } catch (e) {
      // Error al iniciar sesión
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error al iniciar sesión: $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Correo electrónico'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('INICIAR SESIÓN'),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterScreen()),
                );
              },
              child: Text(
                '¿No tienes una cuenta? Regístrate',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



