import 'package:flutter/material.dart';
import 'package:quiz_apk/models/questions.dart';
import 'package:quiz_apk/screens/quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.score,
  });

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(width: 1000),
          Text(
            'Score Anda : ',
            style: TextStyle(
              color: Colors.blueGrey[900],
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: CircularProgressIndicator(
                  strokeWidth: 11,
                  value: score / 15,
                  color: Colors.green[300],
                  backgroundColor: Colors.white,
                ),
              ),
              Column(
                children: [
                  Text(
                    score.toString(),
                    style: TextStyle(
                        fontSize: 80,
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${(score / bankSoal.length * 100).round()}%',
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
              backgroundColor: Colors.blueGrey[900],
            ),
            child: const Text(
              'Restart Quiz',
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
