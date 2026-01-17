import 'package:flutter/material.dart';
import '../../widgets/input_field.dart';
import '../../widgets/primary_button.dart';
import '../profile/create_profile_screen.dart';
import '../home/main_shell.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String selectedRole = 'entrepreneur'; // default role

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

                // Input Fields
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
                const SizedBox(height: 16),

                // Role Selection
                DropdownButtonFormField<String>(
                  value: selectedRole,
                  decoration: const InputDecoration(
                    labelText: "Select Role",
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(
                        value: 'entrepreneur', child: Text("Entrepreneur")),
                    DropdownMenuItem(
                        value: 'investor', child: Text("Investor")),
                    DropdownMenuItem(value: 'mentor', child: Text("Mentor")),
                  ],
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => selectedRole = val);
                    }
                  },
                ),

                const SizedBox(height: 24),
                PrimaryButton(
                  text: "Sign Up",
                  onTap: () {
                    // Navigate to Profile Creation, passing role
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProfileCreationScreen(
                          userRole: selectedRole,
                          navigateToHome:
                              true, // automatically go to MainShell after finish
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
