import 'package:flutter/material.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Startup Pitch Night",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text("Mar 20, 2026 • Richards Bay"),
            SizedBox(height: 12),
            Text(
              "Pitch your startup to investors and get feedback + funding.\n\n"
              "• Networking\n"
              "• Mentorship\n"
              "• Funding opportunities",
            ),
          ],
        ),
      ),
    );
  }
}
