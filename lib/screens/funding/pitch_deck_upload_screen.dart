import 'package:flutter/material.dart';

class PitchDeckUploadScreen extends StatelessWidget {
  const PitchDeckUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Upload Pitch Deck")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.upload_file, size: 80),
            const SizedBox(height: 20),
            const Text("Upload your pitch deck PDF"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: file picker upload
              },
              child: const Text("Upload"),
            ),
          ],
        ),
      ),
    );
  }
}
