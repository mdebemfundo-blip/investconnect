import 'package:flutter/material.dart';

class ProfileCompletionBar extends StatelessWidget {
  final double completion; // 0.0 -> 1.0
  const ProfileCompletionBar({super.key, required this.completion});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: completion,
      minHeight: 6,
      backgroundColor: Colors.grey[200],
      color: Colors.blueAccent,
    );
  }
}
