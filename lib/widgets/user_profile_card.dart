import 'package:flutter/material.dart';
import 'edit_profile_photo_overlay.dart';

class UserProfileCard extends StatelessWidget {
  final String userName;
  final String profileImagePath;
  final VoidCallback onGetVerified;

  const UserProfileCard({
    super.key,
    required this.userName,
    required this.profileImagePath,
    required this.onGetVerified, required Null Function() onEditProfilePicture,
  });

  void _showEditProfilePhotoOverlay(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: EditProfilePhotoOverlay(
            onTakePhoto: () {
              // Implement take photo functionality
              print('Take a new photo');
            },
            onChoosePhoto: () {
              // Implement choose photo functionality
              print('Choose from photo library');
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final shorterSide = size.shortestSide;
    final fontSize = shorterSide * 0.04;
    final profileSize = shorterSide * 0.2;
    final editButtonSize = profileSize * 0.3;

    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(shorterSide * 0.04),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => _showEditProfilePhotoOverlay(context),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: profileSize / 2,
                    backgroundImage: AssetImage(profileImagePath),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: editButtonSize,
                      height: editButtonSize,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.edit, size: editButtonSize * 0.6),
                        onPressed: () => _showEditProfilePhotoOverlay(context),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: shorterSide * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: fontSize * 1.2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: shorterSide * 0.02),
                  OutlinedButton.icon(
                    onPressed: onGetVerified,
                    icon: Icon(Icons.verified, size: fontSize, color: Colors.grey,),
                    label: Text(
                      'Get Verified',
                      style: TextStyle(fontSize: fontSize * 0.8, color: Colors.black),
                    ),
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey[500]!)
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
