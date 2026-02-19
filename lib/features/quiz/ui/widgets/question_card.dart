import 'package:flutter/material.dart';
import '../../cubit/quiz_state.dart';
import 'answer_tile.dart';

class QuestionCard extends StatelessWidget {
  final QuizState state;
  final void Function(int index) onPick;

  const QuestionCard({super.key, required this.state, required this.onPick});

  @override
  Widget build(BuildContext context) {
    final q = state.current;
    if (q == null) return const Center(child: CircularProgressIndicator());

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = isDark ? const Color(0xFF0E1A2B) : Colors.white;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          margin: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFF006FE5),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Savol:",
                style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),
              ),
              const SizedBox(height: 6),
              Text(q.text, style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 15)),
            ],
          ),
        ),

        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            "Javoblar",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: isDark ? Colors.white54 : Colors.black38,
            ),
          ),
        ),
        const SizedBox(height: 12),

        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            itemCount: q.options.length,
            separatorBuilder: (_, _) => const SizedBox(height: 10),
            itemBuilder: (context, i) {
              return AnswerTile(
                label: q.options[i].label,
                text: q.options[i].text,
                index: i,
                selectedIndex: state.currentSelectedIndex,
                correctIndex: q.correctIndex,
                submitted: state.currentSubmitted,
                onTap: () => onPick(i),
              );
            },
          ),
        ),
      ],
    );
  }
}
