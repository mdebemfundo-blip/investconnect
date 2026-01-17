import 'package:flutter/material.dart';
import '../../screens/business/business_dashboard_screen.dart';
import '../../screens/connect/connect_screen.dart';
import '../../screens/deals/deal_tracking_screen.dart';
import '../../screens/events/events_screen.dart';
import '../../screens/funding/funding_request_screen.dart';
import '../../screens/home/home_feed_screen.dart';
import '../../screens/payment/payments_screen.dart';
import '../../screens/profile/profile_screen.dart';
import '../../screens/settings/settings_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white, // <-- clean background
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Color(0xFF0B6EFF), // brand blue
                child: Icon(Icons.person, color: Colors.white),
              ),
              accountName: const Text(
                "Mfundo Sithole",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: const Text(
                "mfundo@example.com",
                style: TextStyle(color: Colors.grey),
              ),
            ),

            const SizedBox(height: 8),

            // Drawer Items
            _drawerItem(
              context,
              icon: Icons.home,
              title: "Home Feed",
              onTap: () => _navigate(context, const HomeFeedScreen()),
            ),
            _drawerItem(
              context,
              icon: Icons.request_quote,
              title: "Funding Request",
              onTap: () => _navigate(context, const FundingRequestScreen()),
            ),
            _drawerItem(
              context,
              icon: Icons.business_center,
              title: "Business Dashboard",
              onTap: () => _navigate(context, const BusinessDashboardScreen()),
            ),
            _drawerItem(
              context,
              icon: Icons.track_changes,
              title: "Deal Tracking",
              onTap: () => _navigate(context, const DealTrackingScreen()),
            ),
            _drawerItem(
              context,
              icon: Icons.event,
              title: "Events",
              onTap: () => _navigate(context, const EventsScreen()),
            ),
            _drawerItem(
              context,
              icon: Icons.payment,
              title: "Payments",
              onTap: () => _navigate(context, const PaymentsScreen()),
            ),
            _drawerItem(
              context,
              icon: Icons.people,
              title: "Connect",
              onTap: () => _navigate(context, const ConnectScreen()),
            ),

            const Divider(),

            _drawerItem(
              context,
              icon: Icons.person,
              title: "Profile",
              onTap: () => _navigate(context, const ProfileScreen()),
            ),
            _drawerItem(
              context,
              icon: Icons.settings,
              title: "Settings",
              onTap: () => _navigate(context, const SettingsScreen()),
            ),

            const Divider(),

            _drawerItem(
              context,
              icon: Icons.logout,
              title: "Logout",
              onTap: () {
                // TODO: Add logout logic
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF0B6EFF)),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }

  void _navigate(BuildContext context, Widget screen) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }
}
