import 'package:flutter/material.dart';

class InvestorDashboard extends StatelessWidget {
  const InvestorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Investor Dashboard")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _metric("Saved Startups", "12"),
          _metric("Active Deals", "3"),
          const SizedBox(height: 16),
          _action("Browse Startups", Icons.search),
          _action("Saved Opportunities", Icons.bookmark),
          _action("Deal Pipeline", Icons.track_changes),
        ],
      ),
    );
  }

  Widget _metric(String title, String value) => Card(
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
