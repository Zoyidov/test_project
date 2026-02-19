import '../data/quiz_models.dart';

class QuizState {
  final List<QuizQuestion> questions;
  final int currentIndex;

  final Map<String, int> selectedById;

  final Map<String, bool> results;

  final bool isDark;
  final int remainingSeconds;
  final bool timerStarted;

  const QuizState({
    this.questions = const [],
    this.currentIndex = 0,
    this.selectedById = const {},
    this.results = const {},
    this.isDark = false,
    this.remainingSeconds = 0,
    this.timerStarted = false,
  });

  int get total => questions.length;

  QuizQuestion? get current =>
      questions.isEmpty ? null : questions[currentIndex];

  int? get currentSelectedIndex {
    final q = current;
    if (q == null) return null;
    return selectedById[q.id];
  }

  bool get currentSubmitted {
    final q = current;
    if (q == null) return false;
    return results.containsKey(q.id);
  }

  Map<int, bool> get answeredByIndex {
    final map = <int, bool>{};
    for (var i = 0; i < questions.length; i++) {
      final q = questions[i];
      if (results.containsKey(q.id)) map[i] = results[q.id]!;
    }
    return map;
  }

  QuizState copyWith({
    List<QuizQuestion>? questions,
    int? currentIndex,
    Map<String, int>? selectedById,
    Map<String, bool>? results,
    bool? isDark,
    int? remainingSeconds,
    bool? timerStarted,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedById: selectedById ?? this.selectedById,
      results: results ?? this.results,
      isDark: isDark ?? this.isDark,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      timerStarted: timerStarted ?? this.timerStarted,
    );
  }

  int get correctCount => results.values.where((e) => e).length;

  int get wrongCount => results.values.where((e) => !e).length;

  bool get isFinished =>
      questions.isNotEmpty && results.length == questions.length;

  double get percent {
    if (questions.isEmpty) return 0;
    return correctCount / questions.length;
  }
}
