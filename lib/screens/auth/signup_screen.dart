import 'package:flutter/material.dart';
import '../../widgets/input_field.dart';
import '../../widgets/primary_button.dart';
import '../profile/create_profile_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String selectedRole = 'startup';

  final List<Map<String, String>> roles = const [
    {'key': 'startup', 'label': 'Startup / Founder'},
    {'key': 'investor', 'label': 'Investor'},
    {'key': 'mentor', 'label': 'Mentor'},
    {'key': 'cofounder', 'label': 'Co-founder'},
    {'key': 'broker', 'label': 'Broker'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Create your account",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 24),

                // ================= INPUTS =================
                const InputField(hint: "Full Name", icon: Icons.person_outline),
                const SizedBox(height: 16),
                const InputField(hint: "Email", icon: Icons.email_outlined),
                const SizedBox(height: 16),
                const InputField(
                    hint: "Password", icon: Icons.lock_outline, obscure: true),
                const SizedBox(height: 16),
                const InputField(
                    hint: "Confirm Password",
                    icon: Icons.lock_outline,
                    obscure: true),
                const SizedBox(height: 20),

                // ================= ROLE SELECTION =================
                DropdownButtonFormField<String>(
                  value: selectedRole,
                  decoration: const InputDecoration(
                    labelText: "Select Your Role",
                    border: OutlineInputBorder(),
                  ),
                  items: roles
                      .map(
                        (role) => DropdownMenuItem(
                          value: role['key'],
                          child: Text(role['label']!),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => selectedRole = val);
                    }
                  },
                ),

                const SizedBox(height: 28),

                // ================= CTA =================
                PrimaryButton(
                  text: "Continue",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProfileCreationScreen(
                          userRole: selectedRole,
                          navigateToHome: true,
                        ),
                      ),
                    );
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
