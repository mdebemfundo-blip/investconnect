import 'package:flutter/material.dart';
import 'subscription_screen.dart';
import 'transactions_screen.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  int selectedIndex = 0;

  final tabs = const [
    Text("Subscription"),
    Text("Transactions"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payments & Monetization"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),

          // TAB BAR
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ToggleButtons(
              isSelected: [selectedIndex == 0, selectedIndex == 1],
              borderRadius: BorderRadius.circular(10),
              selectedColor: Colors.white,
              fillColor: Colors.blue,
              onPressed: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              children: tabs,
            ),
          ),

          const SizedBox(height: 16),

          Expanded(
            child: selectedIndex == 0
                ? const SubscriptionScreen()
                : const TransactionsScreen(),
          ),
        ],
      ),
    );
  }
}
