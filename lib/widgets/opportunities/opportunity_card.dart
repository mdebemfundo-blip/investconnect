import 'package:flutter/material.dart';

class OpportunityCard extends StatelessWidget {
  final String title;
  final String company;
  final String type;
  final String location;
  final String description;
  final String deadline;

  const OpportunityCard({
    super.key,
    required this.title,
    required this.company,
    required this.type,
    required this.location,
    required this.description,
    required this.deadline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Chip(
                label: Text(type),
                backgroundColor: Colors.blue.shade50,
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            company,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),

          const SizedBox(height: 8),

          Text(
            description,
            style: const TextStyle(fontSize: 14),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(location, style: const TextStyle(color: Colors.grey)),
                ],
              ),
              Text(deadline, style: const TextStyle(color: Colors.grey)),
            ],
          ),

          const SizedBox(height: 12),

          // Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text("View"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Apply"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
