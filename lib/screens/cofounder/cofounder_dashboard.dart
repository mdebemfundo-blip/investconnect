import 'package:flutter/material.dart';

class CoFounderDashboard extends StatelessWidget {
  const CoFounderDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Co-Founder Dashboard")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _action("Find Startups", Icons.search),
          _action("Saved Matches", Icons.favorite),
          _action("Equity Discussions", Icons.percent),
        ],
      ),
    );
  }

  Widget _action(String title, IconData icon) => Card(
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        ),
      );
}
