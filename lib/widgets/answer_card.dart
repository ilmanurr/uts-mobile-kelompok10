import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.question,
    required this.yangDipilih,
    required this.indexSaatIni,
    required this.indexJawabanBenar,
    required this.indexJawabanDipilih,
  });

  final String question;
  final bool yangDipilih;
  final int? indexJawabanBenar;
  final int? indexJawabanDipilih;
  final int indexSaatIni;

  @override
  Widget build(BuildContext context) {
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
                          ? Colors.green
                          : apakahJawabanSalah
                              ? Colors.red
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

Widget buatIconBenar() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.green,
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );

Widget buatIconSalah() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.red,
      child: Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
