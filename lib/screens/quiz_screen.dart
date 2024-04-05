import 'package:flutter/material.dart';
import 'package:quiz_apk/models/questions.dart';
import 'package:quiz_apk/screens/result_screen.dart';
import 'package:quiz_apk/widgets/answer_card.dart';
import 'package:quiz_apk/widgets/next_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? indexJawabanDipilih;
  int indexPertanyaan = 0;
  int score = 0;

  void pilihJawaban(int value) {
    indexJawabanDipilih = value;
    final question = bankSoal[indexPertanyaan];
    if (indexJawabanDipilih == question.indexJawabanBenar) {
      score++;
    }
    setState(() {});
  }

  void keSoalBerikutnya() {
    if (indexPertanyaan < bankSoal.length - 1) {
      indexPertanyaan++;
      indexJawabanDipilih = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final question = bankSoal[indexPertanyaan];
    bool pertanyaanTerakhir = indexPertanyaan == bankSoal.length - 1;
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: const Text('Quiz App',
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
            Text(question.pertanyaan, style: const TextStyle(
              fontSize: 25, color: Colors.white,
            ),
            textAlign: TextAlign.center,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: question.pilihanJawaban.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: indexJawabanDipilih == null
                      ? () => pilihJawaban(index)
                      : null,
                  child: AnswerCard(
                    indexSaatIni: index,
                    question: question.pilihanJawaban[index],
                    yangDipilih: indexJawabanDipilih == index,
                    indexJawabanDipilih: indexJawabanDipilih,
                    indexJawabanBenar: question.indexJawabanBenar,
                  ),
                );
              },
            ),
            // Next button
            pertanyaanTerakhir 
                ? TombolNext(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => ResultScreen(
                            score: score,
                      ),
                    ),
                  );
                },
                label: 'Finish',
                )
                : TombolNext(onPressed: indexJawabanDipilih != null ? keSoalBerikutnya : null,
                label: 'Next')
          ],
        ),
      ),
    );
  }
}

