import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        _TransactionTile(
          title: "Pro Plan",
          subtitle: "Monthly subscription",
          amount: "R79",
          date: "Jan 15, 2026",
          status: "Paid",
        ),
        _TransactionTile(
          title: "Starter Plan",
          subtitle: "Monthly subscription",
          amount: "R29",
          date: "Dec 15, 2025",
          status: "Paid",
        ),
        _TransactionTile(
          title: "Elite Plan",
          subtitle: "Monthly subscription",
          amount: "R149",
          date: "Nov 15, 2025",
          status: "Failed",
        ),
      ],
    );
  }
}

class _TransactionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final String date;
  final String status;

  const _TransactionTile({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: const Icon(Icons.receipt_long),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(date, style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 2),
            Text(
              status,
              style: TextStyle(
                fontSize: 12,
                color: status == "Paid" ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
