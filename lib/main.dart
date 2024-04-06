import 'package:flutter/material.dart';
import 'package:quiz_apk/screens/welcome_screen.dart'; // Import welcome screen untuk ditampilkan saat aplikasi dimulai

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key}); // Konstruktor untuk widget utama aplikasi

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Mengatur agar banner debug tidak ditampilkan
      debugShowCheckedModeBanner: false,

      // Menetapkan welcome screen sebagai halaman utama aplikasi
      // dan yang ditampilkan saat aplikasi dimulai
      home: const WelcomeScreen(),
    );
  }
}
