import 'package:flutter/material.dart';
import '../../widgets/primary_button.dart';
import '../profile/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Navigate to Settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),

            // Profile Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Mfundo Sithole",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Entrepreneur • Richards Bay",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Building scalable fintech solutions for small businesses.",
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Stats
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _statTile("Posts", "12"),
                  _statTile("Followers", "120"),
                  _statTile("Following", "98"),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Edit Profile Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PrimaryButton(
                text: "Edit Profile",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EditProfileScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Tabs (Posts / About / Connections)
            DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  const TabBar(
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.blue,
                    tabs: [
                      Tab(text: "Posts"),
                      Tab(text: "About"),
                      Tab(text: "Connections"),
                    ],
                  ),
                  SizedBox(
                    height: 400,
                    child: TabBarView(
                      children: [
                        // Posts
                        ListView(
                          padding: const EdgeInsets.all(16),
                          children: const [
                            Text("User posts will show here"),
                          ],
                        ),

                        // About
                        ListView(
                          padding: const EdgeInsets.all(16),
                          children: const [
                            Text(
                              "Bio & details go here.\n\n"
                              "Industry: Fintech\n"
                              "Stage: Seed\n"
                              "Looking for: Investors & Mentors",
                            ),
                          ],
                        ),

                        // Connections
                        ListView(
                          padding: const EdgeInsets.all(16),
                          children: const [
                            Text("Connections list goes here"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statTile(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
