import 'package:flutter/material.dart';
import '../broker/broker_dashboard.dart';
import '../cofounder/cofounder_dashboard.dart';
import '../home/main_shell.dart';

// Dashboards

import '../../widgets/input_field.dart';
import '../../widgets/primary_button.dart';
import '../investor/investor_dashboard.dart';
import '../mentor/mentor_dashboard.dart';
import '../startup/startup_dashboard.dart';

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
    Widget destination;

    switch (widget.userRole.toLowerCase()) {
      case 'investor':
        destination = const InvestorDashboard();
        break;
      case 'mentor':
        destination = MentorDashboard();
        break;
      case 'co-founder':
        destination = const CoFounderDashboard();
        break;
      case 'broker':
        destination = const BrokerDashboard();
        break;
      case 'start-up':
      case 'startup':
      default:
        destination = const StartupDashboard();
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => destination),
      (_) => false,
    );
  }

  List<Step> _buildSteps() {
    switch (widget.userRole.toLowerCase()) {
      case 'investor':
        return _investorSteps();
      case 'mentor':
        return _mentorSteps();
      case 'broker':
        return _brokerSteps();
      case 'co-founder':
        return _coFounderSteps();
      case 'startup':
      case 'start-up':
      default:
        return _entrepreneurSteps();
    }
  }

  @override
  Widget build(BuildContext context) {
    final steps = _buildSteps();

    return Scaffold(
      appBar: AppBar(title: const Text("Create Profile")),
      body: Stepper(
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

  // ================= STARTUP =================

  List<Step> _entrepreneurSteps() => [
        Step(
          title: const Text("Business Info"),
          content: Column(
            children: const [
              InputField(hint: "Business Name", icon: Icons.business),
              SizedBox(height: 12),
              InputField(hint: "Industry", icon: Icons.category),
              SizedBox(height: 12),
              InputField(hint: "Region", icon: Icons.location_on),
            ],
          ),
        ),
        Step(
          title: const Text("Funding"),
          content: Column(
            children: const [
              InputField(hint: "Funding Needed", icon: Icons.money),
              SizedBox(height: 12),
              InputField(hint: "Pitch Deck URL", icon: Icons.link),
            ],
          ),
        ),
      ];

  // ================= INVESTOR =================

  List<Step> _investorSteps() => [
        Step(
          title: const Text("Investor Profile"),
          content: Column(
            children: const [
              InputField(hint: "Investor Type", icon: Icons.account_balance),
              SizedBox(height: 12),
              InputField(hint: "Preferred Sectors", icon: Icons.category),
            ],
          ),
        ),
      ];

  // ================= MENTOR =================

  List<Step> _mentorSteps() => [
        Step(
          title: const Text("Mentor Profile"),
          content: Column(
            children: const [
              InputField(hint: "Expertise", icon: Icons.school),
              SizedBox(height: 12),
              InputField(hint: "Experience", icon: Icons.work),
            ],
          ),
        ),
      ];

  // ================= CO-FOUNDER =================

  List<Step> _coFounderSteps() => [
        Step(
          title: const Text("Co-Founder Profile"),
          content: Column(
            children: const [
              InputField(hint: "Skills", icon: Icons.build),
              SizedBox(height: 12),
              InputField(hint: "Equity Expectation", icon: Icons.percent),
            ],
          ),
        ),
      ];

  // ================= BROKER =================

  List<Step> _brokerSteps() => [
        Step(
          title: const Text("Broker Profile"),
          content: Column(
            children: const [
              InputField(hint: "Deal Type", icon: Icons.swap_horiz),
              SizedBox(height: 12),
              InputField(hint: "Commission Rate", icon: Icons.percent),
            ],
          ),
        ),
      ];
}
