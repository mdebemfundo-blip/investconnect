import 'package:flutter/material.dart';
import '../../widgets/connect/connect_user_card.dart';

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),

            /// SEARCH
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search entrepreneurs, investors, mentors",
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

            /// LIST
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  ConnectUserCard(
                    name: "EcoGrow Ltd",
                    role: "Entrepreneur",
                    subtitle: "AgriTech • South Africa",
                  ),
                  ConnectUserCard(
                    name: "Andile Mthembu",
                    role: "Investor",
                    subtitle: "Angel Investor • Fintech",
                  ),
                  ConnectUserCard(
                    name: "Sipho Dlamini",
                    role: "Mentor",
                    subtitle: "Startup Growth & Strategy",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
