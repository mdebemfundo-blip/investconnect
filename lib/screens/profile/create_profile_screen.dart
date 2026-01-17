import 'package:flutter/material.dart';
import '../home/main_shell.dart';

import '../../widgets/input_field.dart';
import '../../widgets/primary_button.dart';

class ProfileCreationScreen extends StatefulWidget {
  final String userRole;
  final bool navigateToHome;

  const ProfileCreationScreen({
    super.key,
    required this.userRole,
    this.navigateToHome = false,
  });

  @override
  State<ProfileCreationScreen> createState() => _ProfileCreationScreenState();
}

class _ProfileCreationScreenState extends State<ProfileCreationScreen> {
  int currentStep = 0;

  void _finishProfile() {
    if (widget.navigateToHome) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainShell()),
      );
    }
  }

  List<Step> _buildSteps() {
    switch (widget.userRole) {
      case 'investor':
        return _investorSteps();
      case 'mentor':
        return _mentorSteps();
      default:
        return _entrepreneurSteps();
    }
  }

  @override
  Widget build(BuildContext context) {
    final steps = _buildSteps();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Profile"),
      ),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: currentStep,
        steps: steps,
        onStepContinue: () {
          if (currentStep < steps.length - 1) {
            setState(() => currentStep++);
          } else {
            _finishProfile();
          }
        },
        onStepCancel: () {
          if (currentStep > 0) {
            setState(() => currentStep--);
          }
        },
        controlsBuilder: (context, details) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: PrimaryButton(
              text: currentStep == steps.length - 1
                  ? "Finish Profile"
                  : "Continue",
              onTap: details.onStepContinue!,
            ),
          );
        },
      ),
    );
  }

  // ================= ENTREPRENEUR =================

  List<Step> _entrepreneurSteps() {
    return [
      Step(
        title: const Text("Business Info"),
        isActive: currentStep >= 0,
        content: Column(
          children: const [
            InputField(hint: "Business Name", icon: Icons.business),
            SizedBox(height: 12),
            InputField(hint: "Industry / Sector", icon: Icons.category),
            SizedBox(height: 12),
            InputField(hint: "Country / Region", icon: Icons.location_on),
            SizedBox(height: 12),
            InputField(hint: "Legal Status (Pty, LLC, etc)", icon: Icons.gavel),
          ],
        ),
      ),
      Step(
        title: const Text("Traction"),
        isActive: currentStep >= 1,
        content: Column(
          children: const [
            InputField(
                hint: "Stage (Idea, MVP, Revenue)", icon: Icons.timeline),
            SizedBox(height: 12),
            InputField(hint: "Monthly Revenue", icon: Icons.attach_money),
            SizedBox(height: 12),
            InputField(hint: "Number of Customers", icon: Icons.people),
          ],
        ),
      ),
      Step(
        title: const Text("Funding Needs"),
        isActive: currentStep >= 2,
        content: Column(
          children: const [
            InputField(hint: "Funding Amount Needed", icon: Icons.money),
            SizedBox(height: 12),
            InputField(hint: "Use of Funds", icon: Icons.description),
            SizedBox(height: 12),
            InputField(hint: "Pitch Deck URL", icon: Icons.link),
          ],
        ),
      ),
    ];
  }

  // ================= INVESTOR =================

  List<Step> _investorSteps() {
    return [
      Step(
        title: const Text("Investor Profile"),
        isActive: currentStep >= 0,
        content: Column(
          children: const [
            InputField(
                hint: "Investor Type (Angel, VC)", icon: Icons.account_balance),
            SizedBox(height: 12),
            InputField(hint: "Preferred Industries", icon: Icons.category),
            SizedBox(height: 12),
            InputField(hint: "Preferred Region", icon: Icons.public),
          ],
        ),
      ),
      Step(
        title: const Text("Investment Criteria"),
        isActive: currentStep >= 1,
        content: Column(
          children: const [
            InputField(hint: "Ticket Size (Min)", icon: Icons.trending_up),
            SizedBox(height: 12),
            InputField(hint: "Ticket Size (Max)", icon: Icons.trending_up),
            SizedBox(height: 12),
            InputField(hint: "Risk Appetite", icon: Icons.warning),
          ],
        ),
      ),
    ];
  }

  // ================= MENTOR =================

  List<Step> _mentorSteps() {
    return [
      Step(
        title: const Text("Mentor Profile"),
        isActive: currentStep >= 0,
        content: Column(
          children: const [
            InputField(hint: "Area of Expertise", icon: Icons.school),
            SizedBox(height: 12),
            InputField(hint: "Years of Experience", icon: Icons.history),
            SizedBox(height: 12),
            InputField(hint: "Industries Worked In", icon: Icons.work),
          ],
        ),
      ),
      Step(
        title: const Text("Availability"),
        isActive: currentStep >= 1,
        content: Column(
          children: const [
            InputField(
                hint: "Availability (Weekly/Monthly)", icon: Icons.schedule),
            SizedBox(height: 12),
            InputField(hint: "Mentorship Type", icon: Icons.support),
            SizedBox(height: 12),
            InputField(hint: "LinkedIn / Portfolio URL", icon: Icons.link),
          ],
        ),
      ),
    ];
  }
}
