import 'package:flutter/material.dart';
import 'package:quiz_apk/models/bank_soal.dart'; // Import daftar pertanyaan
import 'package:quiz_apk/screens/quiz_screen.dart'; // Import layar kuis untuk digunakan saat pengguna memilih restart quis.

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.score, // Skor dari quis yang ditampilkan di layar hasi
  });

  final int score; // Variabel untuk menyimpan skor dari quis

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600], // Warna latar belakang layar hasil
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(width: 1000), // Spasi kosong di bagian atas layar hasil
          Text(
            'Score Anda', // Judul untuk menampilkan skor
            style: TextStyle(
              color: Colors.blueGrey[900],
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Stack untuk menampilkan indikator lingkaran progres dan teks skor
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: CircularProgressIndicator(
                  strokeWidth: 11,
                  value: score / 15, // Nilai progres berdasarkan skor, dengan 15 pertanyaan
                  color: Colors.green[300],
                  backgroundColor: Colors.white,
                ),
              ),
              // Kolom untuk menampilkan teks skor
              Column(
                children: [
                  Text(
                    score.toString(), // Menampilkan skor
                    style: TextStyle(
                        fontSize: 80,
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(height: 10), // Spasi kosong antara teks skor dan persentase skor
                  Text(
                    '${(score / bankSoal.length * 100).round()}%', // Menghitung dan menampilkan persentase skor
                    style: TextStyle(
                        fontSize: 27,
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.w500
                    ),
                  )
                ],
              )
            ],
          ),
          // Tombol untuk merestart quis
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const QuizScreen(), // Menavigasi ke quiz screen
              ));
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 50,
              ),
              backgroundColor: Colors.blueGrey[900],
            ),
            child: const Text(
              'Restart Quiz', // Label tombol untuk memulai kembali kuis
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2
              ),
            ),
          ),
        ],
      ),
    );
  }
}
