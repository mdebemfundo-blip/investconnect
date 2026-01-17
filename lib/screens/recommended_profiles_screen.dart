import 'package:flutter/material.dart';
import '/widgets/business/business_card.dart';

class RecommendedProfilesScreen extends StatelessWidget {
  const RecommendedProfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recommended for You")),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          BusinessCard(
            name: "GreenHarvest",
            industry: "Agritech",
            region: "KZN",
            stage: "Seed",
          ),
          BusinessCard(
            name: "SmartWallet",
            industry: "Fintech",
            region: "Gauteng",
            stage: "Pre-Seed",
          ),
        ],
      ),
    );
  }
}
