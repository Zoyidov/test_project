import 'package:flutter/material.dart';
import 'question_index_item.dart';

class QuestionIndexRow extends StatefulWidget {
  final int total;
  final int current;
  final Map<int, bool> answered;
  final void Function(int index) onTap;

  const QuestionIndexRow({
    super.key,
    required this.total,
    required this.current,
    required this.answered,
    required this.onTap,
  });

  @override
  State<QuestionIndexRow> createState() => _QuestionIndexRowState();
}

class _QuestionIndexRowState extends State<QuestionIndexRow> {
  final _controller = ScrollController();

  static const double _itemW = 52;
  static const double _gap = 10;

  @override
  void didUpdateWidget(covariant QuestionIndexRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.current != widget.current ||
        oldWidget.total != widget.total) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _ensureVisible());
    }
  }

  void _ensureVisible() {
    if (!_controller.hasClients) return;

    final viewport = _controller.position.viewportDimension;
    final itemExtent = _itemW + _gap;

    final targetCenter = widget.current * itemExtent + (_itemW / 2);
    final targetOffset = targetCenter - (viewport / 2);

    final max = _controller.position.maxScrollExtent;
    final clamped = targetOffset.clamp(0.0, max);

    _controller.animateTo(
      clamped,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        controller: _controller,
        scrollDirection: Axis.horizontal,
        itemCount: widget.total,
        separatorBuilder: (_, __) => const SizedBox(width: _gap),
        itemBuilder: (context, i) {
          return QuestionIndexItem(
            index: i,
            isActive: i == widget.current,
            answered: widget.answered[i],
            onTap: () => widget.onTap(i),
          );
        },
      ),
    );
  }
}
