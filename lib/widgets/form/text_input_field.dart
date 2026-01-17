import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String label;
  final String hint;
  const TextInputField({super.key, required this.label, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
