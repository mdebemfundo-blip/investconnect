import 'package:flutter/material.dart';

class EventFilters extends StatefulWidget {
  const EventFilters({super.key});

  @override
  State<EventFilters> createState() => _EventFiltersState();
}

class _EventFiltersState extends State<EventFilters> {
  String selected = "Upcoming";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FilterChip(
          label: const Text("Upcoming"),
          selected: selected == "Upcoming",
          onSelected: (v) {
            setState(() => selected = "Upcoming");
          },
        ),
        const SizedBox(width: 8),
        FilterChip(
          label: const Text("Popular"),
          selected: selected == "Popular",
          onSelected: (v) {
            setState(() => selected = "Popular");
          },
        ),
        const SizedBox(width: 8),
        FilterChip(
          label: const Text("All"),
          selected: selected == "All",
          onSelected: (v) {
            setState(() => selected = "All");
          },
        ),
      ],
    );
  }
}
