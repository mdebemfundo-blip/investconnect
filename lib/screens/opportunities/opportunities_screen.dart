import 'package:flutter/material.dart';
import '../../widgets/opportunities/create_opportunity_modal.dart';
import '../../widgets/opportunities/opportunity_card.dart';

class OpportunitiesScreen extends StatelessWidget {
  const OpportunitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search opportunities",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Filter Chips
            SizedBox(
              height: 42,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                children: [
                  FilterChip(
                    label: const Text("Funding"),
                    selected: false,
                    onSelected: (val) {},
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text("Mentorship"),
                    selected: false,
                    onSelected: (val) {},
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text("Partnership"),
                    selected: false,
                    onSelected: (val) {},
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text("Programs"),
                    selected: false,
                    onSelected: (val) {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Opportunity list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  OpportunityCard(
                    title: "Seed Funding Round",
                    company: "EcoGrow",
                    type: "Funding",
                    location: "South Africa",
                    description:
                        "Looking for investors to close our seed round. 20% equity offered.",
                    deadline: "Ends in 5 days",
                  ),
                  OpportunityCard(
                    title: "Mentorship Program",
                    company: "Startup Hub",
                    type: "Mentorship",
                    location: "Online",
                    description:
                        "6-week mentorship for early-stage founders (product + growth).",
                    deadline: "Ends in 10 days",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // FAB for creating opportunity
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => const CreateOpportunityModal(),
          );
        },
      ),
    );
  }
}
