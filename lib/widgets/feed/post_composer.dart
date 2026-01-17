import 'package:flutter/material.dart';

class PostComposer extends StatelessWidget {
  const PostComposer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            child: Icon(Icons.person),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Share an update with the community...",
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
