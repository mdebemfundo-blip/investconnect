import 'package:flutter/material.dart';

class BrokerDashboard extends StatelessWidget {
  const BrokerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Broker Dashboard")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _metric("Active Deals", "5"),
          _metric("Commission Earned", "R120,000"),
          const SizedBox(height: 16),
          _action("Manage Deals", Icons.handshake),
          _action("Clients", Icons.people),
          _action("Transaction History", Icons.receipt),
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
