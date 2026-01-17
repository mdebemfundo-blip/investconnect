import 'package:flutter/material.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            "Choose your plan",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Upgrade to unlock premium features.",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 24),

          // PLANS
          _PlanCard(
            title: "Starter",
            price: "R29 / month",
            perks: const ["Post 3 opportunities", "Basic analytics"],
            isRecommended: false,
          ),

          const SizedBox(height: 12),

          _PlanCard(
            title: "Pro",
            price: "R79 / month",
            perks: const [
              "Unlimited posts",
              "Advanced analytics",
              "Priority support"
            ],
            isRecommended: true,
          ),

          const SizedBox(height: 12),

          _PlanCard(
            title: "Elite",
            price: "R149 / month",
            perks: const ["All features", "VIP support", "Featured listing"],
            isRecommended: false,
          ),
        ],
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> perks;
  final bool isRecommended;

  const _PlanCard({
    required this.title,
    required this.price,
    required this.perks,
    required this.isRecommended,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isRecommended ? 6 : 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                const Spacer(),
                if (isRecommended)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Recommended",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Text(price,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            for (var perk in perks)
              Row(
                children: [
                  const Icon(Icons.check, size: 18, color: Colors.green),
                  const SizedBox(width: 8),
                  Text(perk),
                ],
              ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: connect payment gateway
                },
                child: const Text("Subscribe"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
