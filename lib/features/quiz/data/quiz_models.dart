enum AnswerStatus { correct, wrong, idle }

class QuizQuestion {
  final String id;
  final String text;
  final List<QuizOption> options;
  final int correctIndex;

  const QuizQuestion({
    required this.id,
    required this.text,
    required this.options,
    required this.correctIndex,
  });
}

class QuizOption {
  final String label;
  final String text;

  const QuizOption({required this.label, required this.text});
}
