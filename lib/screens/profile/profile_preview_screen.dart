import 'package:flutter/material.dart';

class ProfilePreviewScreen extends StatelessWidget {
  final String name;
  final String role;
  final String subtitle;
  final String bio;

  const ProfilePreviewScreen({
    super.key,
    required this.name,
    required this.role,
    required this.subtitle,
    required this.bio,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 44,
              child: Icon(Icons.person, size: 40),
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Chip(
              label: Text(role),
              backgroundColor: Colors.blue.shade50,
            ),
            const SizedBox(height: 24),
            Text(
              bio,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.chat),
              label: const Text("Message"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
