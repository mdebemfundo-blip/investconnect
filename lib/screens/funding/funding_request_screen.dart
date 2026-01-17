import 'package:flutter/material.dart';
import '../../widgets/input_field.dart';
import '../../widgets/primary_button.dart';

class FundingRequestScreen extends StatelessWidget {
  const FundingRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Funding Request")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const InputField(hint: "Funding amount", icon: Icons.money),
                const SizedBox(height: 16),
                const InputField(
                  hint: "Use of funds (short)",
                  icon: Icons.description,
                ),
                const SizedBox(height: 16),
                const InputField(
                  hint: "Business stage (Seed/Series A/Other)",
                  icon: Icons.timeline,
                ),
                const SizedBox(height: 16),
                const InputField(
                  hint: "Expected ROI/Exit",
                  icon: Icons.trending_up,
                ),
                const SizedBox(height: 16),
                PrimaryButton(
                  text: "Submit Request",
                  onTap: () {
                    // TODO: Submit
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
