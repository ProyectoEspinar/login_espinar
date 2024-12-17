import 'package:flutter/material.dart';
import 'login.dart'; // Asegúrate de tener login.dart en tu proyecto
import 'register_screen.dart'; // Asegúrate de tener register_screen.dart en tu proyecto

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retardo de 3 segundos antes de redirigir automáticamente a LoginScreen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          // Fondo de la imagen
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/interfas.jpg'), // Ruta de la imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido encima del fondo
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              // Botón "INGRESAR"
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFB49FF1), // Color del botón
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Navega a LoginScreen al presionar "INGRESAR"
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  child: Text(
                    'INGRESAR',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Texto de registro
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿NO TIENES UNA CUENTA?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navegar a RegisterScreen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterScreen()),
                      );
                    },
                    child: Text(
                      ' REGÍSTRATE',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'login.dart'; // Asegúrate de que tienes login.dart en tu proyecto
// import 'register_screen.dart'; // Asegúrate de importar RegisterScreen
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Fondo de la imagen
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/interfas.jpg'), // Ruta de la imagen de fondo
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Contenido encima del fondo
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Spacer(),
//               // Botón "INGRESAR"
//               Center(
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFFB49FF1), // Color del botón
//                     padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   onPressed: () {
//                     // Navega a LoginScreen al presionar "INGRESAR"
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const LoginScreen()),
//                     );
//                   },
//                   child: Text(
//                     'INGRESAR',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Texto de registro
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     '¿NO TIENES UNA CUENTA?',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       // Navegar a RegisterScreen
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const RegisterScreen()),
//                       );
//                     },
//                     child: Text(
//                       ' REGÍSTRATE',
//                       style: TextStyle(
//                         color: Colors.red,
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Spacer(),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
