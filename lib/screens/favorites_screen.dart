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

    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Favorites',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: _buildGrid('All Favorites', true),
            ),
            SizedBox(height: 16), // Space between grids
            Expanded(
              child: _buildGrid('Personalized Favorite Lists', false),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _buildGrid(String title, bool isDefault) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (isDefault) ...[
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'DEFAULT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
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
                  Icon(Icons.favorite_border, size: 50, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('You have no favorites saved on this list'),
                  Text('Use the favorite icon to save ads that you want to check later.'),
                ],
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite, size: 50, color: Colors.blue),
                  SizedBox(height: 16),
                  Text('Create your personalized list'),
                  Text('Organize your favorites'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Handle "Make A List" button press
                    },
                    child: Text('Make A List'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                    ),
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
