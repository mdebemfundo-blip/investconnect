import 'package:flutter/material.dart';
import 'deal_detail_screen.dart';

class DealTrackingScreen extends StatelessWidget {
  const DealTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deal Tracking"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const DealCard(
            dealName: "EcoGrow Seed Round",
            company: "EcoGrow",
            status: "In Discussion",
          ),
          const DealCard(
            dealName: "Fintech Series A",
            company: "PayConnect",
            status: "Due Diligence",
          ),
          const DealCard(
            dealName: "Agritech Bridge Loan",
            company: "AgriBoost",
            status: "Lead",
          ),
        ],
      ),
    );
  }
}

class DealCard extends StatelessWidget {
  final String dealName;
  final String company;
  final String status;

  const DealCard({
    super.key,
    required this.dealName,
    required this.company,
    required this.status,
  });

  Color getStatusColor() {
    switch (status) {
      case "Lead":
        return Colors.grey;
      case "In Discussion":
        return Colors.blue;
      case "Term Sheet":
        return Colors.orange;
      case "Due Diligence":
        return Colors.purple;
      case "Closed":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DealDetailScreen(
              dealName: dealName,
              company: company,
              status: status,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(Icons.business),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dealName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    company,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            Chip(
              label: Text(status),
              backgroundColor: getStatusColor().withOpacity(0.2),
              labelStyle: TextStyle(color: getStatusColor()),
            ),
          ],
        ),
      ),
    );
  }
}
