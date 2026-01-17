import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String location;
  final String description;
  final VoidCallback onTap;

  const EventCard({
    super.key,
    required this.title,
    required this.date,
    required this.location,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
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
            // Title
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 8),

            // Date & Location
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 14),
                const SizedBox(width: 6),
                Text(date),
                const SizedBox(width: 16),
                const Icon(Icons.location_on, size: 14),
                const SizedBox(width: 6),
                Text(location),
              ],
            ),

            const SizedBox(height: 12),

            // Description
            Text(
              description,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
