import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/quiz_cubit.dart';
import '../../cubit/quiz_state.dart';
import '../quiz_result_widget/action_buttons.dart';
import '../quiz_result_widget/circle_indicator.dart';
import '../quiz_result_widget/result_stat_wrap.dart';
import '../quiz_result_widget/timer_row.dart';

class QuizResultPage extends StatelessWidget {
  final int remainingSeconds;

  final int totalSeconds;

  const QuizResultPage({
    super.key,
    required this.remainingSeconds,
    this.totalSeconds = 20 * 60,
  });

  String _format(int seconds) {
    final safe = seconds < 0 ? 0 : seconds;
    final m = safe ~/ 60;
    final s = safe % 60;
    return "${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        final percent = state.percent.clamp(0.0, 1.0);
        final percentText = (percent * 100).round();

        final int ball =
        state.correctCount >= (state.questions.length * 0.8) ? 1 : 0;

        final leftText = _format(totalSeconds);
        final rightText = _format(remainingSeconds);

        return Scaffold(
          backgroundColor: const Color(0xFFF3F5F7),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final outerPad = (constraints.maxWidth < 360) ? 12.0 : 18.0;

                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(outerPad),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 380),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 18,
                              offset: const Offset(0, 10),
                              color: Colors.black.withOpacity(0.08),
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(18, 20, 18, 18),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                LayoutBuilder(
                                  builder: (context, c) {
                                    final availableW = c.maxWidth;
                                    final ringSize =
                                    (availableW * 0.65).clamp(90.0, 120.0);

                                    return SizedBox(
                                      width: ringSize,
                                      height: ringSize,
                                      child: Center(
                                        child: SegmentedRingIndicator(
                                          value: percent,
                                          text: "$percentText%",
                                          trackColor: const Color(0xFFD8DEE8),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 14),

                                Text(
                                  "Yakunlandi",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: const Color(0xFF1F2937),
                                  ),
                                ),
                                const SizedBox(height: 6),

                                Text(
                                  ball == 0
                                      ? "Afsuski sizga ball taqdim etilmadi"
                                      : "Sizga 1 ball taqdim etildi",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                    color: const Color(0xFF6B7280),
                                    height: 1.25,
                                  ),
                                ),
                                const SizedBox(height: 2),

                                Text(
                                  "Ja’mi to’plangan ballaringiz soni: $ball ta",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                    color: const Color(0xFF6D86B3),
                                    height: 1.25,
                                  ),
                                ),
                                const SizedBox(height: 10),

                                Text(
                                  "Umumiy testlar soni: ${state.questions.length}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                    color: const Color(0xFF6B7280),
                                  ),
                                ),
                                const SizedBox(height: 14),

                                ResultStatsWrap(
                                  correct: state.correctCount,
                                  wrong: state.wrongCount,
                                ),
                                const SizedBox(height: 10),

                                ResultTimerRow(
                                  left: leftText,
                                  right: rightText,
                                ),
                                const SizedBox(height: 12),

                                ResultActionButtons(
                                  onRetry: () {
                                    context.read<QuizCubit>().reset();
                                    Navigator.of(context).pop();
                                  },
                                  onExit: () => Navigator.of(context).pop(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}





