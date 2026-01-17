import 'package:flutter/material.dart';
import '../connect/connect_screen.dart';
import '../events/events_screen.dart';
import '../opportunities/opportunities_screen.dart';
import '../payment/payments_screen.dart';
import '../payment/subscription_badge.dart';
import 'home_feed_screen.dart';
import '../../widgets/navigation/bottom_nav.dart';
import '../../widgets/navigation/app_drawer.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int currentIndex = 0;

  final screens = const [
    HomeFeedScreen(),
    ConnectScreen(),
    OpportunitiesScreen(),
    PaymentsScreen(), // NEW
    EventsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text(
          "InvestConnect",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          // 🔥 Subscription Badge
          const SubscriptionBadge(),

          const SizedBox(width: 12),
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
      ),
    );
  }
}
