import 'package:flutter/material.dart';

class BusinessCard extends StatelessWidget {
  final String name;
  final String industry;
  final String region;
  final String stage;

  const BusinessCard({
    super.key,
    required this.name,
    required this.industry,
    required this.region,
    required this.stage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.business)),
        title: Text(name),
        subtitle: Text("$industry • $region • $stage"),
        trailing: IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {
            // TODO: save favorite
          },
        ),
        onTap: () {
          // TODO: open business profile
        },
      ),
    );
  }
}
