import 'package:flutter/material.dart';
import '../navigation/bottom_nav_bar.dart';
import '../widgets/menu_action_card.dart';
import '../widgets/user_profile_card.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final shorterSide = size.shortestSide;
    final padding = shorterSide * 0.04;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu',
          style: TextStyle(
            fontSize: shorterSide * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
              UserProfileCard(
                userName: 'John Doe', // Replace with actual user name
                profileImagePath: 'assets/images/profile_placeholder.png',
                onEditProfilePicture: () {
                  // Handle edit profile picture
                },
                onGetVerified: () {
                  // Handle get verified action
                },
              ),
              SizedBox(height: padding),
              _buildActionCards(context),
              // Add more menu items here
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _buildActionCards(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final shorterSide = size.shortestSide;

    return Row(
      children: [
        Expanded(
          child: MenuActionCard(
            icon: Icons.ad_units,
            title: 'My Ads',
            onTap: () {
              // Handle My Ads tap
            },
          ),
        ),
        SizedBox(width: shorterSide * 0.04),
        Expanded(
          child: MenuActionCard(
            icon: Icons.search,
            title: 'My Searches',
            onTap: () {
              // Handle My Searches tap
            },
          ),
        ),
      ],
    );
  }
}
