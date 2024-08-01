import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  final String userName;
  final String profileImagePath;
  final VoidCallback onEditProfilePicture;
  final VoidCallback onGetVerified;

  const UserProfileCard({
    super.key,
    required this.userName,
    required this.profileImagePath,
    required this.onEditProfilePicture,
    required this.onGetVerified,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final shorterSide = size.shortestSide;
    final fontSize = shorterSide * 0.04;
    final profileSize = shorterSide * 0.2;
    final editButtonSize = profileSize * 0.3;

    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(shorterSide * 0.04),
        child: Row(
          children: [
            Stack(
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
                      onPressed: onEditProfilePicture,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
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
                  ElevatedButton.icon(
                    onPressed: onGetVerified,
                    icon: Icon(Icons.verified, size: fontSize),
                    label: Text(
                      'Get Verified',
                      style: TextStyle(fontSize: fontSize * 0.8),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
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
