import 'package:flutter/material.dart';
import '../../widgets/business/business_card.dart';

class BusinessDashboardScreen extends StatelessWidget {
  const BusinessDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Discover Businesses")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const _FilterBar(),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: const [
                  BusinessCard(
                    name: "EcoGrow",
                    industry: "Agritech",
                    region: "KZN",
                    stage: "Seed",
                  ),
                  BusinessCard(
                    name: "FinPulse",
                    industry: "Fintech",
                    region: "Gauteng",
                    stage: "Series A",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _FilterBar extends StatelessWidget {
  const _FilterBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              hintText: "Search businesses",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () {
            // TODO: open filter modal
          },
        )
      ],
    );
  }
}
