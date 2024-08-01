// lib/screens/menu_screen.dart

import 'package:flutter/material.dart';
import '../navigation/bottom_nav_bar.dart';
import '../widgets/menu_action_card.dart';
import '../widgets/user_profile_card.dart';
import '../widgets/menu_list_item.dart';

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
              SizedBox(height: padding),
              _buildMenuItems(context),
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

  Widget _buildMenuItems(BuildContext context) {
    return Column(
      children: [
        MenuListItem(
          icon: Icons.person,
          title: 'Profile',
          onTap: () {
            // Handle Profile tap
          },
        ),
        MenuListItem(
          icon: Icons.settings,
          title: 'Account Settings',
          onTap: () {
            // Handle Account Settings tap
          },
        ),
        MenuListItem(
          icon: Icons.notifications,
          title: 'Notification Settings',
          onTap: () {
            // Handle Notification Settings tap
          },
        ),
        MenuListItem(
          icon: Icons.security,
          title: 'Security',
          onTap: () {
            // Handle Security tap
          },
        ),
        MenuListItem(
          icon: Icons.directions_car,
          title: 'Car Appointments',
          onTap: () {
            // Handle Car Appointments tap
          },
        ),
        MenuListItem(
          icon: Icons.location_city,
          title: 'City',
          onTap: () {
            // Handle City tap
          },
        ),
        MenuListItem(
          icon: Icons.language,
          title: 'Language',
          onTap: () {
            // Handle Language tap
          },
        ),
        MenuListItem(
          icon: Icons.article,
          title: 'Blogs',
          onTap: () {
            // Handle Blogs tap
          },
        ),
        MenuListItem(
          icon: Icons.support,
          title: 'Support',
          onTap: () {
            // Handle Support tap
          },
        ),
        MenuListItem(
          icon: Icons.phone,
          title: 'Call Us',
          onTap: () {
            // Handle Call Us tap
          },
        ),
        MenuListItem(
          icon: Icons.description,
          title: 'Terms and Conditions',
          onTap: () {
            // Handle Terms and Conditions tap
          },
        ),
        MenuListItem(
          icon: Icons.ad_units,
          title: 'Advertising',
          onTap: () {
            // Handle Advertising tap
          },
        ),
        MenuListItem(
          icon: Icons.logout,
          title: 'Log Out',
          onTap: () {
            // Handle Log Out tap
          },
          iconColor: Colors.red, // Set the icon color to red
          showTrailing: false, // Set this to false to hide the trailing arrow
        ),
      ],
    );
  }
}
