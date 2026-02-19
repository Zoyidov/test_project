import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/quiz_repository.dart';
import 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final QuizRepository repo;
  Timer? _timer;

  QuizCubit(this.repo) : super(const QuizState());

  Future<void> load() async {
    final list = await repo.fetchQuestions();

    emit(
      state.copyWith(
        questions: list,
        currentIndex: 0,
        remainingSeconds: list.length * 60,
      ),
    );
  }

  void _startTimer() {
    if (state.timerStarted) return;

    emit(state.copyWith(timerStarted: true));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingSeconds <= 1) {
        timer.cancel();
        emit(state.copyWith(remainingSeconds: 0));
        return;
      }

      emit(state.copyWith(remainingSeconds: state.remainingSeconds - 1));
    });
  }

  void toggleTheme() => emit(state.copyWith(isDark: !state.isDark));

  void pick(int index) {
    final q = state.current;
    if (q == null) return;

    if (!state.timerStarted) {
      _startTimer();
    }

    if (state.results.containsKey(q.id)) return;

    final newSelected = Map<String, int>.from(state.selectedById)
      ..[q.id] = index;

    final isCorrect = index == q.correctIndex;
    final newResults = Map<String, bool>.from(state.results)
      ..[q.id] = isCorrect;

    emit(state.copyWith(selectedById: newSelected, results: newResults));

    Future.delayed(const Duration(seconds: 2), () {
      if (isClosed) return;

      if (state.current?.id == q.id) {
        next();
      }
    });
  }

  void next() {
    if (state.questions.isEmpty) return;
    if (state.currentIndex >= state.questions.length - 1) return;
    emit(state.copyWith(currentIndex: state.currentIndex + 1));
  }

  void prev() {
    if (state.questions.isEmpty) return;
    if (state.currentIndex == 0) return;
    emit(state.copyWith(currentIndex: state.currentIndex - 1));
  }

  void jumpTo(int index) {
    if (index < 0 || index >= state.questions.length) return;
    emit(state.copyWith(currentIndex: index));
  }

  void reset() {
    _timer?.cancel();

    emit(
      state.copyWith(
        currentIndex: 0,
        selectedById: const {},
        results: const {},
        remainingSeconds: state.questions.length * 60,
        timerStarted: false,
      ),
    );
  }
}
