import 'package:flutter/material.dart';

class ResultActionButtons extends StatelessWidget {
  final VoidCallback onRetry;
  final VoidCallback onExit;

  const ResultActionButtons({
    super.key,
    required this.onRetry,
    required this.onExit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 46,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2F6FDB),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 0,
            ),
            onPressed: onRetry,
            icon: const Icon(Icons.refresh, size: 18),
            label: const Text("Qayta urinish"),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 46,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE9EDF2),
              foregroundColor: const Color(0xFF98A2B3),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 0,
            ),
            onPressed: onExit,
            child: const Text("Chiqish"),
          ),
        ),
      ],
    );
  }
}
