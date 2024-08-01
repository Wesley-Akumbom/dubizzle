import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../navigation/bottom_nav_bar.dart';
import '../provider/navigation_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Set the correct index when the screen is built
    Provider.of<NavigationProvider>(context, listen: false).setIndex(1);

    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth * 0.04;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            Expanded(
              child: _buildGrid('All Favorites', true, screenWidth),
            ),
            SizedBox(height: padding), // Space between grids
            Expanded(
              child: _buildGrid('Personalized Favorite Lists', false, screenWidth),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _buildGrid(String title, bool isDefault, double screenWidth) {
    final titleFontSize = screenWidth * 0.05;
    final iconSize = screenWidth * 0.1;
    final padding = screenWidth * 0.02;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(padding),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (isDefault) ...[
                  SizedBox(width: padding),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'DEFAULT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFontSize * 0.6,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: isDefault
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: iconSize, color: Colors.grey),
                  SizedBox(height: padding),
                  Text('You have no favorites saved on this list', style: TextStyle(fontSize: titleFontSize * 0.8)),
                  Text('Use the favorite icon to save ads that you want to check later.', style: TextStyle(fontSize: titleFontSize * 0.6)),
                ],
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite, size: iconSize, color: Colors.blue),
                  SizedBox(height: padding),
                  Text('Create your personalized list', style: TextStyle(fontSize: titleFontSize * 0.8)),
                  Text('Organize your favorites', style: TextStyle(fontSize: titleFontSize * 0.6)),
                  SizedBox(height: padding),
                  ElevatedButton(
                    onPressed: () {
                      // Handle "Make A List" button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      textStyle: TextStyle(fontSize: titleFontSize * 0.6),
                    ),
                    child: const Text('Make A List'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
