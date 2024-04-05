import 'package:flutter/material.dart';
import 'package:quiz_apk/screens/quiz_screen.dart'; // Import halaman quiz jika belum diimport

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            const Image(image: AssetImage('images/icon quiz2.png')),
            const SizedBox(height: 90),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const QuizScreen(),
                ));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 50,
                ),
                backgroundColor: Colors.blueGrey[900], // Warna latar belakang tombol
              ),
              child: const Text(
                'Mulai Quiz',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              'Developed by Kelompok 10 MI2022B',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12
              ),
            )
          ],
        ),
      ),
    );
  }
}
