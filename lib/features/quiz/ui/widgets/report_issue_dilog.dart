import 'package:flutter/material.dart';
import 'package:test_project/core/widgets/app_svg.dart';

import '../../../../core/constants/app_icons.dart';

class ReportIssueDialog extends StatefulWidget {
  final String? initialText;

  const ReportIssueDialog({super.key, this.initialText});

  static Future<String?> show(BuildContext context, {String? initialText}) {
    return showDialog<String?>(
      context: context,
      barrierDismissible: true,
      builder: (_) => ReportIssueDialog(initialText: initialText),
    );
  }

  @override
  State<ReportIssueDialog> createState() => _ReportIssueDialogState();
}

class _ReportIssueDialogState extends State<ReportIssueDialog> {
  late final TextEditingController _controller;
  final _focusNode = FocusNode();

  String? _error;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText ?? "");
    WidgetsBinding.instance.addPostFrameCallback((_) => _focusNode.requestFocus());
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _controller.text.trim();

    if (text.length < 5) {
      setState(() => _error = "Kamida 5 ta belgi yozing");
      return;
    }

    Navigator.of(context).pop(text);
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isSmall = w < 360;

    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      backgroundColor: cs.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 20, 18, 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _DialogBodyText(),
              const SizedBox(height: 18),

              _MessageField(
                controller: _controller,
                focusNode: _focusNode,
                errorText: _error,
                onChanged: (_) {
                  if (_error != null) setState(() => _error = null);
                },
              ),

              const SizedBox(height: 18),

              _DialogActions(
                isSmall: isSmall,
                onBack: () => Navigator.of(context).pop(null),
                onSend: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DialogBodyText extends StatelessWidget {
  const _DialogBodyText();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Text(
      "Ushbu muloqot oynasi orqali, aynan shu test savolidagi xato va kamchiliklarni tuzatishga yordam berishingiz mumkin. Aynan shu test savolidagi xato haqida batafsil yozing!",
      textAlign: TextAlign.center,
      style: theme.textTheme.bodyMedium?.copyWith(
        fontSize: 15,
        height: 1.25,
        fontWeight: FontWeight.w400,
        color: cs.onSurface.withOpacity(0.55),
      ),
    );
  }
}

class _MessageField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? errorText;
  final ValueChanged<String> onChanged;

  const _MessageField({
    required this.controller,
    required this.focusNode,
    required this.errorText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final fill = cs.surfaceContainerHighest;
    final enabledBorder = cs.outlineVariant.withOpacity(0.8);
    final focusedBorder = cs.outline.withOpacity(0.9);

    return TextField(
      controller: controller,
      focusNode: focusNode,
      maxLines: 3,
      minLines: 3,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: cs.onSurface,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      onChanged: onChanged,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        filled: true,
        fillColor: fill,
        hintText: "",
        errorText: errorText,
        contentPadding: const EdgeInsets.all(14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: enabledBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: focusedBorder, width: 1.4),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: cs.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: cs.error, width: 1.4),
        ),
      ),
    );
  }
}

class _DialogActions extends StatelessWidget {
  final bool isSmall;
  final VoidCallback onBack;
  final VoidCallback onSend;

  const _DialogActions({
    required this.isSmall,
    required this.onBack,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final backBtn = SizedBox(
      height: 54,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: cs.surfaceContainerHighest,
          foregroundColor: cs.onSurface.withOpacity(0.7),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onBack,
        child: Text(
          "Qaytish",
          style: theme.textTheme.titleMedium?.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: cs.onSurface.withOpacity(0.7),
          ),
        ),
      ),
    );

    final sendBtn = SizedBox(
      height: 54,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF006FE5),
          foregroundColor: cs.onPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onSend,
        icon: AppSvg(path: AppIcons.send, size: 24),
        label: Text(
          "Yuborish",
          style: theme.textTheme.titleMedium?.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: cs.onPrimary,
          ),
        ),
      ),
    );

    if (isSmall) {
      return Column(
        children: [
          SizedBox(width: double.infinity, child: backBtn),
          const SizedBox(height: 12),
          SizedBox(width: double.infinity, child: sendBtn),
        ],
      );
    }

    return Row(
      children: [
        Expanded(child: backBtn),
        const SizedBox(width: 14),
        Expanded(child: sendBtn),
      ],
    );
  }
}
