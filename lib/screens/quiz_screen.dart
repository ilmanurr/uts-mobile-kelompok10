import 'package:flutter/material.dart';
import 'package:quiz_apk/models/bank_soal.dart';
import 'package:quiz_apk/screens/result_screen.dart';
import 'package:quiz_apk/widgets/answer_card.dart';
import 'package:quiz_apk/widgets/next_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key}); // Constructor untuk membuat objek QuizScreen

  @override
  State<QuizScreen> createState() => _QuizScreenState(); // Membuat state untuk QuizScreen
}

class _QuizScreenState extends State<QuizScreen> {
  int? indexJawabanDipilih; // Indeks jawaban yang dipilih oleh pengguna
  int indexPertanyaan = 0; // Indeks pertanyaan saat ini.
  int score = 0; // Skor sementara dari jawaban yang benar

  // Fungsi untuk menangani pemilihan jawaban
  void pilihJawaban(int value) {
    indexJawabanDipilih = value; // Set indeks jawaban yang dipilih
    final question = bankSoal[indexPertanyaan]; // Pertanyaan saat ini
    // Periksa apakah jawaban yang dipilih benar, jika ya, tambahkan skor
    if (indexJawabanDipilih == question.indexJawabanBenar) {
      score++;
    }
    setState(() {}); // Memperbarui tampilan setelah pemilihan jawaban
  }

  // Fungsi untuk navigasi ke pertanyaan berikutnya
  void keSoalBerikutnya() {
    // Periksa apakah masih ada pertanyaan berikutnya
    if (indexPertanyaan < bankSoal.length - 1) {
      indexPertanyaan++; // Pindah ke pertanyaan berikutnya
      indexJawabanDipilih = null; // Reset pilihan jawaban
    }
    setState(() {}); // Memperbarui tampilan setelah navigasi
  }

  @override
  Widget build(BuildContext context) {
    final question = bankSoal[indexPertanyaan]; // Pertanyaan saat ini
    bool pertanyaanTerakhir = indexPertanyaan == bankSoal.length - 1; // Apakah ini pertanyaan terakhir?

    // Memperbarui tampilan kuis
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: const Text(
              'QuizTime', // Judul aplikasi
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 3,
              ),
            )
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              question.pertanyaan, // Teks pertanyaan diambil dari list bankSoal
              style: const TextStyle(
                fontSize: 25, color: Colors.white,
            ),
            textAlign: TextAlign.center,
            ),
            // Daftar jawaban untuk pertanyaan saat ini
            ListView.builder(
              shrinkWrap: true,
              itemCount: question.pilihanJawaban.length, // Jumlah item dalam ListView
              itemBuilder: (context, index) { // Membangun setiap item dalam ListView
                return GestureDetector( // Menggunakan GestureDetector untuk menangkap ketukan pada item
                  // Menetapkan fungsi pilihJawaban(index) ketika item ditekan
                  // kecuali jika jawaban sudah dipilih sebelumnya
                  onTap: indexJawabanDipilih == null
                      ? () => pilihJawaban(index)
                      : null,
                  child: AnswerCard( // Menggunakan widget AnswerCard sebagai tampilan setiap item
                    indexSaatIni: index, // Memberikan indeks saat ini ke AnswerCard
                    question: question.pilihanJawaban[index], // Memberikan teks jawaban ke AnswerCard
                    yangDipilih: indexJawabanDipilih == index, // Menandai apakah jawaban saat ini dipilih atau tidak
                    indexJawabanDipilih: indexJawabanDipilih, // Memberikan indeks jawaban yang dipilih ke AnswerCard
                    indexJawabanBenar: question.indexJawabanBenar, // Memberikan indeks jawaban yang benar ke AnswerCard
                  ),
                );
              },
            ),
            // Next button
            // Tombol "Next" untuk navigasi ke pertanyaan berikutnya atau result screen
            pertanyaanTerakhir 
                ? TombolNext(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => ResultScreen(
                            score: score, // Menyampaikan skor ke result screen
                      ),
                    ),
                  );
                },
                label: 'Finish', // Label tombol untuk pertanyaan terakhir
                )
                : TombolNext(onPressed: indexJawabanDipilih != null ? keSoalBerikutnya : null,
                label: 'Next') // Label tombol untuk yang bukan pertanyaan terakhir
          ],
        ),
      ),
    );
  }
}

