import 'package:flutter/material.dart';
import '../../widgets/input_field.dart';
import '../../widgets/primary_button.dart';

class MentorshipRequestScreen extends StatelessWidget {
  const MentorshipRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mentorship Request")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const InputField(
                  hint: "What mentorship do you need?",
                  icon: Icons.lightbulb_outline,
                ),
                const SizedBox(height: 16),
                const InputField(
                  hint: "Your current challenge",
                  icon: Icons.warning_amber_outlined,
                ),
                const SizedBox(height: 16),
                const InputField(
                  hint: "Preferred mentor industry",
                  icon: Icons.business_center,
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
