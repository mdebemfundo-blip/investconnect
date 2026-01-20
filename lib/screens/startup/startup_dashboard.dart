import 'package:flutter/material.dart';

class StartupDashboard extends StatefulWidget {
  const StartupDashboard({super.key});

  @override
  State<StartupDashboard> createState() => _StartupDashboardState();
}

class _StartupDashboardState extends State<StartupDashboard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      // ================= APP BAR =================
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Startup Dashboard",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey.shade200,
            child: const Icon(Icons.person, color: Colors.black),
          ),
          const SizedBox(width: 12),
        ],
      ),

      // ================= BODY =================
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _statRow(),
          const SizedBox(height: 20),
          _sectionTitle("AI Investor Matches"),
          _aiMatchCard(),
          const SizedBox(height: 24),
          _sectionTitle("Manage Your Startup"),
          _actionCard(
            icon: Icons.request_quote_outlined,
            title: "Funding Requests",
            subtitle: "Create and manage funding needs",
          ),
          _actionCard(
            icon: Icons.upload_file_outlined,
            title: "Pitch Deck",
            subtitle: "Upload or update your pitch",
          ),
          _actionCard(
            icon: Icons.handshake_outlined,
            title: "Active Deals",
            subtitle: "Track investor discussions",
          ),
          _actionCard(
            icon: Icons.people_outline,
            title: "Co-founders",
            subtitle: "Find or manage co-founders",
          ),
        ],
      ),

      // ================= FLOATING BUTTON =================
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Open Create Pitch / Funding modal
        },
        label: const Text("Create Pitch"),
        icon: const Icon(Icons.add),
      ),

      // ================= BOTTOM NAV =================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(
              icon: Icon(Icons.auto_awesome), label: "Matches"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }

  // ================= UI COMPONENTS =================

  Widget _sectionTitle(String title) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      );

  Widget _statRow() => Row(
        children: [
          _statCard(
              label: "Interested Investors",
              value: "6",
              icon: Icons.favorite_border),
          _statCard(label: "Active Deals", value: "2", icon: Icons.handshake),
          _statCard(
              label: "Profile Views", value: "24", icon: Icons.visibility),
        ],
      );

  Widget _statCard(
      {required String label, required String value, required IconData icon}) {
    return Expanded(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 22, color: Colors.blue),
              const SizedBox(height: 10),
              Text(
                value,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(label,
                  style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _aiMatchCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color(0xFFE8F0FE),
          child: Icon(Icons.auto_awesome, color: Colors.blue),
        ),
        title: const Text("87% Match with Angel Investor"),
        subtitle: const Text("Based on your pitch, sector, and funding stage"),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Open match details
        },
      ),
    );
  }

  Widget _actionCard(
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}
