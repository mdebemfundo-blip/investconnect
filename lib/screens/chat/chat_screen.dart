import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  const ChatScreen({super.key, required this.name});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();
  final List<Map<String, dynamic>> messages = [
    {"fromMe": false, "text": "Hi! Are you available for a pitch?"},
    {"fromMe": true, "text": "Yes! When works for you?"},
    {"fromMe": false, "text": "Tomorrow at 3pm."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              child: Icon(Icons.person),
            ),
            const SizedBox(width: 12),
            Text(widget.name),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return Align(
                  alignment: msg["fromMe"]
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: msg["fromMe"]
                          ? Colors.blue.shade50
                          : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(msg["text"]),
                  ),
                );
              },
            ),
          ),

          // Message composer
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Type a message...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (controller.text.trim().isNotEmpty) {
                      setState(() {
                        messages.add({
                          "fromMe": true,
                          "text": controller.text.trim(),
                        });
                        controller.clear();
                      });
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
