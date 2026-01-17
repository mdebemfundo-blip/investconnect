import 'package:flutter/material.dart';

class DealDetailScreen extends StatefulWidget {
  final String dealName;
  final String company;
  final String status;

  const DealDetailScreen({
    super.key,
    required this.dealName,
    required this.company,
    required this.status,
  });

  @override
  State<DealDetailScreen> createState() => _DealDetailScreenState();
}

class _DealDetailScreenState extends State<DealDetailScreen> {
  String currentStatus = "Lead";

  final List<Map<String, String>> updates = [
    {"status": "Lead", "note": "Deal created and awaiting response."},
    {"status": "In Discussion", "note": "Pitch sent and waiting for feedback."},
  ];

  final TextEditingController updateController = TextEditingController();

  final List<String> statuses = [
    "Lead",
    "In Discussion",
    "Term Sheet",
    "Due Diligence",
    "Closed"
  ];

  @override
  void initState() {
    super.initState();
    currentStatus = widget.status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dealName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // STATUS PROGRESS
            _StatusProgress(
              currentStatus: currentStatus,
              statuses: statuses,
            ),

            const SizedBox(height: 16),

            // UPDATE LIST
            Expanded(
              child: ListView.builder(
                itemCount: updates.length,
                itemBuilder: (context, index) {
                  final update = updates[index];
                  return ListTile(
                    leading: const Icon(Icons.update),
                    title: Text(update["status"]!),
                    subtitle: Text(update["note"]!),
                  );
                },
              ),
            ),

            const Divider(),

            // ADD UPDATE
            TextField(
              controller: updateController,
              decoration: InputDecoration(
                hintText: "Add a status update...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (updateController.text.isNotEmpty) {
                      setState(() {
                        updates.add({
                          "status": currentStatus,
                          "note": updateController.text.trim(),
                        });
                        updateController.clear();
                      });
                    }
                  },
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _StatusProgress extends StatelessWidget {
  final String currentStatus;
  final List<String> statuses;

  const _StatusProgress({
    required this.currentStatus,
    required this.statuses,
  });

  @override
  Widget build(BuildContext context) {
    final currentIndex = statuses.indexOf(currentStatus);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: statuses.map((status) {
        final index = statuses.indexOf(status);
        final isActive = index <= currentIndex;

        return Column(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: isActive ? Colors.blue : Colors.grey.shade300,
              child: Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              status,
              style: TextStyle(
                fontSize: 10,
                color: isActive ? Colors.black : Colors.grey,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
