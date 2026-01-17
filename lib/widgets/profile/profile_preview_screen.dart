import 'package:flutter/material.dart';
import '../../models/connection_status.dart';
import '../../widgets/profile/connect_button.dart';

class ProfilePreviewScreen extends StatefulWidget {
  final String name;
  final String role;
  final String bio;

  const ProfilePreviewScreen({
    super.key,
    required this.name,
    required this.role,
    required this.bio,
    required String subtitle,
  });

  @override
  State<ProfilePreviewScreen> createState() => _ProfilePreviewScreenState();
}

class _ProfilePreviewScreenState extends State<ProfilePreviewScreen> {
  ConnectionStatus status = ConnectionStatus.none;

  void handleConnect() {
    setState(() {
      if (status == ConnectionStatus.none) {
        status = ConnectionStatus.requested;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 48,
              child: Icon(Icons.person, size: 48),
            ),
            const SizedBox(height: 16),
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.role,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              widget.bio,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ConnectButton(
              status: status,
              onPressed: handleConnect,
            ),
            const SizedBox(height: 32),
            _InfoCard(title: "Interests", value: "Fintech, Agritech"),
            _InfoCard(title: "Location", value: "South Africa"),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;

  const _InfoCard({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(value),
        ],
      ),
    );
  }
}
