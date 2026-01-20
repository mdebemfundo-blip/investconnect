import 'package:flutter/material.dart';
import '/widgets/form/text_input_field.dart';
import '/widgets/form/dropdown_field.dart';

/// ================= START-UP STEPS =================
class StartupStep1 extends StatelessWidget {
  const StartupStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextInputField(
          label: "Startup Name",
          hint: "Enter your startup name",
        ),
        SizedBox(height: 10),
        DropdownField(
          label: "Industry / Sector",
          items: ["Fintech", "Agritech", "Health", "E-commerce", "AI"],
        ),
        SizedBox(height: 10),
        TextInputField(
          label: "Operating Region",
          hint: "e.g., Southern Africa",
        ),
        SizedBox(height: 10),
        DropdownField(
          label: "Business Stage",
          items: ["Idea", "MVP", "Early Revenue", "Scaling"],
        ),
      ],
    );
  }
}

class StartupStep2 extends StatelessWidget {
  const StartupStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextInputField(
          label: "Team Size",
          hint: "Number of team members",
        ),
        SizedBox(height: 10),
        TextInputField(
          label: "Traction / Metrics",
          hint: "Users, revenue, partnerships",
        ),
        SizedBox(height: 10),
        TextInputField(
          label: "Funding Required",
          hint: "Amount you are seeking",
        ),
      ],
    );
  }
}

class StartupStep3 extends StatelessWidget {
  const StartupStep3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextInputField(
          label: "Pitch Deck / Media",
          hint: "Upload pitch, images or video links",
        ),
      ],
    );
  }
}

/// ================= INVESTOR STEPS =================
class InvestorStep1 extends StatelessWidget {
  const InvestorStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextInputField(
          label: "Investor / Firm Name",
          hint: "Individual or firm name",
        ),
        SizedBox(height: 10),
        DropdownField(
          label: "Investor Type",
          items: ["Angel", "VC", "Private Equity", "Fund"],
        ),
        SizedBox(height: 10),
        DropdownField(
          label: "Investment Region",
          items: ["Southern Africa", "Africa", "Global"],
        ),
      ],
    );
  }
}

class InvestorStep2 extends StatelessWidget {
  const InvestorStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        DropdownField(
          label: "Preferred Sectors",
          items: ["Fintech", "Health", "Agritech", "AI", "Logistics"],
        ),
        SizedBox(height: 10),
        TextInputField(
          label: "Ticket Size",
          hint: "Min – Max investment",
        ),
        SizedBox(height: 10),
        DropdownField(
          label: "Investment Focus",
          items: ["Impact", "Commercial", "Both"],
        ),
      ],
    );
  }
}

/// ================= MENTOR STEPS =================
class MentorStep1 extends StatelessWidget {
  const MentorStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextInputField(
          label: "Full Name",
          hint: "Enter your full name",
        ),
        SizedBox(height: 10),
        TextInputField(
          label: "Area of Expertise",
          hint: "e.g., Marketing, Finance, Tech",
        ),
        SizedBox(height: 10),
        TextInputField(
          label: "Experience Summary",
          hint: "Brief professional background",
        ),
      ],
    );
  }
}

class MentorStep2 extends StatelessWidget {
  const MentorStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextInputField(
          label: "Services Offered",
          hint: "Coaching, Advisory, Workshops",
        ),
        SizedBox(height: 10),
        TextInputField(
          label: "Availability",
          hint: "Hours or days per week",
        ),
      ],
    );
  }
}

/// ================= CO-FOUNDER STEPS =================
class CoFounderStep1 extends StatelessWidget {
  const CoFounderStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextInputField(
          label: "Full Name",
          hint: "Enter your name",
        ),
        SizedBox(height: 10),
        TextInputField(
          label: "Primary Skills",
          hint: "Tech, Sales, Marketing, Operations",
        ),
        SizedBox(height: 10),
        DropdownField(
          label: "Preferred Commitment",
          items: ["Full-time", "Part-time", "Flexible"],
        ),
      ],
    );
  }
}

class CoFounderStep2 extends StatelessWidget {
  const CoFounderStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextInputField(
          label: "Equity Expectation",
          hint: "e.g., 10% – 30%",
        ),
        SizedBox(height: 10),
        TextInputField(
          label: "Industries of Interest",
          hint: "Startups or sectors you prefer",
        ),
      ],
    );
  }
}

/// ================= BROKER STEPS =================
class BrokerStep1 extends StatelessWidget {
  const BrokerStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextInputField(
          label: "Broker Name / Company",
          hint: "Enter your name or firm",
        ),
        SizedBox(height: 10),
        DropdownField(
          label: "Broker Type",
          items: ["Investment", "Business Deals", "Startup Matching"],
        ),
        SizedBox(height: 10),
        TextInputField(
          label: "Operating Region",
          hint: "e.g., Africa, Global",
        ),
      ],
    );
  }
}

class BrokerStep2 extends StatelessWidget {
  const BrokerStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextInputField(
          label: "License / Accreditation",
          hint: "Optional",
        ),
        SizedBox(height: 10),
        TextInputField(
          label: "Commission Structure",
          hint: "e.g., Percentage or Fixed fee",
        ),
      ],
    );
  }
}
