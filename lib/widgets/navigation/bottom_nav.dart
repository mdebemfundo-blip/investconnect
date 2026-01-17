import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: "Connect",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business_center),
          label: "Opportunities",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.payment),
          label: "Payments", // NEW
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event_rounded),
          label: "Events",
        ),
      ],
    );
  }
}
