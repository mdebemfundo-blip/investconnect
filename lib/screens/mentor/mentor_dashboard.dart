import 'package:flutter/material.dart';

class MentorDashboard extends StatelessWidget {
  const MentorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mentor Dashboard")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _card("Pending Requests", "4"),
          _card("Active Mentorships", "2"),
          const SizedBox(height: 16),
          _action("Mentorship Requests", Icons.inbox),
          _action("My Startups", Icons.business),
          _action("Availability", Icons.schedule),
        ],
      ),
    );
  }

  Widget _card(String title, String value) => Card(
        child: ListTile(
          title: Text(title),
          trailing: Text(value,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
      );

  Widget _action(String title, IconData icon) => Card(
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        ),
      );
}
