import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.question, // Pertanyaan yang akan ditampilkan dalam answer card
    required this.yangDipilih, // Apakah jawaban ini dipilih oleh pengguna atau tidak
    required this.indexSaatIni, // Indeks pertanyaan saat ini dalam daftar pertanyaan
    required this.indexJawabanBenar, // Indeks jawaban yang benar dari pertanyaan
    required this.indexJawabanDipilih, // Indeks jawaban yang dipilih oleh pengguna
  });

  final String question; // Pertanyaan yang ditampilkan dalam answer card
  final bool yangDipilih; // Menunjukkan apakah jawaban ini dipilih oleh pengguna atau tidak
  final int? indexJawabanBenar; // Indeks jawaban yang benar dari pertanyaan
  final int? indexJawabanDipilih; // Indeks jawaban yang dipilih oleh pengguna
  final int indexSaatIni; // Indeks pertanyaan saat ini dalam daftar pertanyaan

  @override
  Widget build(BuildContext context) {
    // Menentukan apakah jawaban ini benar atau salah berdasarkan indeks jawaban saat ini dan jawaban yang dipilih.
    bool apakahJawabanBenar = indexSaatIni == indexJawabanBenar;
    bool apakahJawabanSalah = !apakahJawabanBenar && yangDipilih;

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        child: indexJawabanDipilih != null
            // jika salah satu pilihan jawaban dipilih
            ? Container(
                height: 70,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[300],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: apakahJawabanBenar
                          ? Colors.green // Jika jawaban benar, tampilkan border warna hijau
                          : apakahJawabanSalah
                              ? Colors.red // Jika jawaban salah, tampilkan border warna merah
                              : Colors.white24),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          question,
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Menampilkan ikon centang jika jawaban benar, dan silang jika jawaban salah
                    apakahJawabanBenar
                        ? buatIconBenar()
                        : apakahJawabanSalah
                            ? buatIconSalah()
                            : const SizedBox.shrink(),
                  ],
                ),
              )
            // Jika tidak ada jawaban yang dipilih
            : Container(
                height: 70,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[300],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white24),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          question,
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }
}

// Widget untuk membuat ikon centang untuk jawaban yang benar
Widget buatIconBenar() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.green,
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );

// Widget untuk membuat ikon silang untuk jawaban yang salah
Widget buatIconSalah() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.red,
      child: Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
