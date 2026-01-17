import 'package:flutter/material.dart';

class MediaUploadScreen extends StatelessWidget {
  const MediaUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Upload Media")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.photo_library, size: 80),
            const SizedBox(height: 20),
            const Text("Upload photos or videos"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: upload
              },
              child: const Text("Upload"),
            ),
          ],
        ),
      ),
    );
  }
}
