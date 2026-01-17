import 'package:flutter/material.dart';
import '../../widgets/input_field.dart';
import '../../widgets/primary_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController roleCtrl = TextEditingController();
  final TextEditingController locationCtrl = TextEditingController();
  final TextEditingController bioCtrl = TextEditingController();
  final TextEditingController websiteCtrl = TextEditingController();
  final TextEditingController industryCtrl = TextEditingController();
  final TextEditingController stageCtrl = TextEditingController();

  @override
  void dispose() {
    nameCtrl.dispose();
    roleCtrl.dispose();
    locationCtrl.dispose();
    bioCtrl.dispose();
    websiteCtrl.dispose();
    industryCtrl.dispose();
    stageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Avatar + Upload
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.blue,
                        child:
                            Icon(Icons.person, size: 50, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO: Upload image
                        },
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.camera_alt,
                              size: 18, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Name
                  InputField(
                    controller: nameCtrl,
                    hint: "Full Name",
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(height: 16),

                  // Role
                  InputField(
                    controller: roleCtrl,
                    hint: "Role (Entrepreneur / Investor / Mentor)",
                    icon: Icons.work_outline,
                  ),
                  const SizedBox(height: 16),

                  // Location
                  InputField(
                    controller: locationCtrl,
                    hint: "Location",
                    icon: Icons.location_on_outlined,
                  ),
                  const SizedBox(height: 16),

                  // Bio
                  InputField(
                    controller: bioCtrl,
                    hint: "Bio",
                    icon: Icons.info_outline,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),

                  // Website
                  InputField(
                    controller: websiteCtrl,
                    hint: "Website",
                    icon: Icons.link,
                  ),
                  const SizedBox(height: 16),

                  // Industry
                  InputField(
                    controller: industryCtrl,
                    hint: "Industry",
                    icon: Icons.business_center_outlined,
                  ),
                  const SizedBox(height: 16),

                  // Stage
                  InputField(
                    controller: stageCtrl,
                    hint: "Stage (Seed / Series A / etc.)",
                    icon: Icons.timeline_outlined,
                  ),

                  const SizedBox(height: 24),

                  PrimaryButton(
                    text: "Save Changes",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // TODO: Save profile data
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Profile Updated")),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
