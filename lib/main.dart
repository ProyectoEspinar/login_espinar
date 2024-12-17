import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app_espinar/splash_screen.dart'; // o la pantalla que uses

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  // Inicializa Firebase aquí
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(), // Pantalla inicial es SplashScreen
      debugShowCheckedModeBanner: false, // Oculta el banner de debug
    );
  }
}
