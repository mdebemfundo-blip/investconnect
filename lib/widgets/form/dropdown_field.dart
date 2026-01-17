import 'package:flutter/material.dart';

class DropdownField extends StatelessWidget {
  final String label;
  final List<String> items;
  const DropdownField({super.key, required this.label, required this.items});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items:
          items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
      onChanged: (_) {},
    );
  }
}
