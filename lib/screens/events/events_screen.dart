import 'package:flutter/material.dart';
import '../../widgets/events/event_card.dart';
import '../../widgets/events/event_filters.dart';
import 'event_details_screen.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Events"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const EventFilters(),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  EventCard(
                    title: "Startup Pitch Night",
                    date: "Mar 20, 2026",
                    location: "Richards Bay",
                    description:
                        "Pitch your startup to investors and get feedback + funding.",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const EventDetailsScreen(),
                        ),
                      );
                    },
                  ),
                  EventCard(
                    title: "Investor Meetup",
                    date: "Apr 05, 2026",
                    location: "Durban",
                    description:
                        "Meet top investors and founders in your industry.",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // FAB to create event
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
