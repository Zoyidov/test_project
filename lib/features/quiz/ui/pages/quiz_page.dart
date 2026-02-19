import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/features/quiz/ui/pages/quiz_result_page.dart';
import '../../cubit/quiz_cubit.dart';
import '../../cubit/quiz_state.dart';
import '../widgets/top_bar.dart';
import '../widgets/question_index_row.dart';
import '../widgets/question_card.dart';
import '../widgets/quiz_footer.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuizCubit, QuizState>(
      listenWhen: (prev, curr) => prev.isFinished != curr.isFinished,
      listener: (context, state) {
        if (state.isFinished) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) =>
                  QuizResultPage(remainingSeconds: state.remainingSeconds),
            ),
          );
        }
      },
      child: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          final cubit = context.read<QuizCubit>();

          final isLast =
              state.total > 0 && state.currentIndex == state.total - 1;
          final currentQ = state.current;
          final canFinish =
              currentQ != null && state.selectedById.containsKey(currentQ.id);

          void goResult() {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) =>
                    QuizResultPage(remainingSeconds: state.remainingSeconds),
              ),
            );
          }

          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: TopBar(
                    onToggleTheme: cubit.toggleTheme,
                    remainingSeconds: state.remainingSeconds,
                    onFinish: () {
                      context.read<QuizCubit>().reset();
                    },
                  ),
                ),
                const SizedBox(height: 12),

                if (state.total > 0)
                  QuestionIndexRow(
                    total: state.total,
                    current: state.currentIndex,
                    answered: state.answeredByIndex,
                    onTap: cubit.jumpTo,
                  ),
                const SizedBox(height: 24),
                Expanded(
                  child: QuestionCard(state: state, onPick: cubit.pick),
                ),
                QuizFooter(
                  current: state.total == 0 ? 0 : (state.currentIndex + 1),
                  total: state.total,
                  onPrev: cubit.prev,
                  onNext: cubit.next,
                  isLast: isLast,
                  canFinish: canFinish,
                  onFinish: goResult,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
