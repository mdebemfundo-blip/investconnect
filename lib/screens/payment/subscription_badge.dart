import 'package:flutter/material.dart';

class SubscriptionBadge extends StatelessWidget {
  const SubscriptionBadge({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with real data later
    bool isSubscribed = true;
    String plan = "Pro";
    String expires = "2026-03-12";

    return GestureDetector(
      onTap: () {
        // Open Payments Screen
        Navigator.pushNamed(context, "/payments");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSubscribed ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              isSubscribed ? Icons.check_circle : Icons.warning,
              size: 16,
              color: Colors.white,
            ),
            const SizedBox(width: 6),
            Text(
              isSubscribed ? "Subscribed" : "Free",
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
