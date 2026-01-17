import 'package:flutter/material.dart';
import '/widgets/form/text_input_field.dart';
import '/widgets/form/dropdown_field.dart';

// ---------------- Entrepreneur Steps ----------------
class EntrepreneurStep1 extends StatelessWidget {
  const EntrepreneurStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextInputField(
            label: "Business Name", hint: "Enter your business name"),
        SizedBox(height: 10),
        DropdownField(
            label: "Sector / Industry",
            items: ["Fintech", "Agritech", "Health"]),
        SizedBox(height: 10),
        TextInputField(label: "Region", hint: "e.g., Southern Africa"),
        SizedBox(height: 10),
        DropdownField(
            label: "Legal Status", items: ["Private", "Public", "LLC"]),
      ],
    );
  }
}

class EntrepreneurStep2 extends StatelessWidget {
  const EntrepreneurStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextInputField(label: "Business Size", hint: "Number of employees"),
        SizedBox(height: 10),
        TextInputField(
            label: "Traction / Revenue", hint: "Enter KPIs or revenue"),
        SizedBox(height: 10),
        TextInputField(label: "Funding Needed", hint: "Amount you are seeking"),
      ],
    );
  }
}

class EntrepreneurStep3 extends StatelessWidget {
  const EntrepreneurStep3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextInputField(
            label: "Upload Media / Pitch", hint: "Add images/videos"),
      ],
    );
  }
}

// ---------------- Investor Steps ----------------
class InvestorStep1 extends StatelessWidget {
  const InvestorStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextInputField(label: "Investor Name", hint: "Full name or firm"),
        SizedBox(height: 10),
        DropdownField(label: "Investor Type", items: ["Angel", "VC", "Fund"]),
        SizedBox(height: 10),
        DropdownField(label: "Region", items: ["Southern Africa", "Global"]),
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
            items: ["Fintech", "Health", "Agritech"]),
        SizedBox(height: 10),
        TextInputField(label: "Ticket Size", hint: "Min-Max investment"),
        SizedBox(height: 10),
        DropdownField(
            label: "Impact vs Commercial",
            items: ["Impact", "Commercial", "Both"]),
      ],
    );
  }
}

// ---------------- Mentor Steps ----------------
class MentorStep1 extends StatelessWidget {
  const MentorStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextInputField(label: "Full Name", hint: "Enter your full name"),
        SizedBox(height: 10),
        TextInputField(label: "Expertise", hint: "e.g., Marketing, Finance"),
        SizedBox(height: 10),
        TextInputField(
            label: "Past Clients / Experience", hint: "Describe experience"),
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
            label: "Services Offered", hint: "E.g., Workshops, Consulting"),
        SizedBox(height: 10),
        TextInputField(label: "Availability", hint: "Days / hours available"),
      ],
    );
  }
}
