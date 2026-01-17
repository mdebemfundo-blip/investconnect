import 'package:flutter/material.dart';

import '../profile/profile_preview_screen.dart';

class ConnectUserCard extends StatefulWidget {
  final String name;
  final String role;
  final String subtitle;

  const ConnectUserCard({
    super.key,
    required this.name,
    required this.role,
    required this.subtitle,
  });

  @override
  State<ConnectUserCard> createState() => _ConnectUserCardState();
}

class _ConnectUserCardState extends State<ConnectUserCard> {
  bool isConnected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          /// AVATAR
          const CircleAvatar(
            radius: 26,
            child: Icon(Icons.person),
          ),

          const SizedBox(width: 12),

          /// INFO
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfilePreviewScreen(
                      name: widget.name,
                      role: widget.role,
                      subtitle: widget.subtitle,
                      bio: 'mdebe',
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Chip(
                    label: Text(widget.role),
                    labelStyle: const TextStyle(fontSize: 11),
                    backgroundColor: Colors.blue.shade50,
                  ),
                ],
              ),
            ),
          ),

          /// CONNECT BUTTON
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isConnected ? Colors.grey.shade300 : Colors.blue,
              foregroundColor: isConnected ? Colors.black : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              setState(() => isConnected = !isConnected);
            },
            child: Text(isConnected ? "Connected" : "Connect"),
          ),
        ],
      ),
    );
  }
}
