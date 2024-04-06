// membuat class Question
// mendefinisikan model pertanyaan untuk quiz
class Question {
  // Atribut-atribut yang diperlukan untuk sebuah pertanyaan
  final String pertanyaan; // teks pertanyaan
  final List<String> pilihanJawaban; // list pilihan jawaban yang tersedia
  final int indexJawabanBenar; // index pilihan jawaban benar

  // Konstruktor untuk membuat objek Question
  const Question({
    required this.indexJawabanBenar,
    required this.pertanyaan,
    required this.pilihanJawaban
  });
}