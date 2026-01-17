import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Profile Settings
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Account"),
              subtitle: const Text("Update profile info"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),

            const Divider(),

            // Notifications
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text("Notifications"),
              subtitle: const Text("Manage notification settings"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),

            const Divider(),

            // Theme
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: const Text("Theme"),
              subtitle: const Text("Light / Dark Mode"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),

            const Divider(),

            // Support
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text("Help & Support"),
              subtitle: const Text("FAQs & Contact"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
