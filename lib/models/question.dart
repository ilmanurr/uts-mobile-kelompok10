class Question {
  final String pertanyaan;
  final List<String> pilihanJawaban;
  final int indexJawabanBenar;

  const Question({
    required this.indexJawabanBenar,
    required this.pertanyaan,
    required this.pilihanJawaban
  });
}