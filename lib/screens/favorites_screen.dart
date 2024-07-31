import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: _buildGrid('All Favorites', true),
            ),
            const SizedBox(height: 16), // Space between grids
            Expanded(
              child: _buildGrid('Personalized Favorite Lists', false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(String title, bool isDefault) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(8),
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
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (isDefault) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
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
                  ? const Column(
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
                  const Icon(Icons.favorite, size: 50, color: Colors.blue),
                  const SizedBox(height: 16),
                  const Text('Create your personalized list'),
                  const Text('Organize your favorites'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Handle "Make A List" button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
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
