import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ChatInboxScreen extends StatelessWidget {
  const ChatInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ChatTile(
            name: "Investor Jane",
            lastMessage: "Let’s schedule a pitch meeting.",
            time: "2h",
            unread: 2,
          ),
          ChatTile(
            name: "EcoGrow Startup",
            lastMessage: "We just updated our traction metrics.",
            time: "1d",
            unread: 0,
          ),
          ChatTile(
            name: "Mentor Sipho",
            lastMessage: "Here are some scaling tips.",
            time: "3d",
            unread: 1,
          ),
        ],
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String time;
  final int unread;

  const ChatTile({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.unread,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: const CircleAvatar(
        radius: 24,
        child: Icon(Icons.person),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(lastMessage),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time),
          const SizedBox(height: 6),
          if (unread > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                unread.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ChatScreen(name: name)),
        );
      },
    );
  }
}
