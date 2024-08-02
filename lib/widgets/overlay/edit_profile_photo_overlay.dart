// lib/widgets/edit_profile_photo_overlay.dart

import 'package:flutter/material.dart';

class EditProfilePhotoOverlay extends StatelessWidget {
  final VoidCallback onTakePhoto;
  final VoidCallback onChoosePhoto;

  const EditProfilePhotoOverlay({
    super.key,
    required this.onTakePhoto,
    required this.onChoosePhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.3, // Maximum 30% of screen height
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Edit Profile Photo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a new photo'),
              onTap: () {
                Navigator.pop(context);
                onTakePhoto();
              },
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from your photo library'),
              onTap: () {
                Navigator.pop(context);
                onChoosePhoto();
              },
            ),
          ],
        ),
      ),
    );
  }
}
