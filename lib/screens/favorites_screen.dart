// lib/screens/favorites_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../navigation/bottom_nav_bar.dart';
import '../provider/navigation_provider.dart';
import '../widgets/favorites_grid.dart';
import '../widgets/overlay/create_list_overlay.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  void _showOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: CreateListOverlay(
              onCancel: () => Navigator.pop(context),
              onCreate: () {
                // Handle list creation
                print('List created');
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<NavigationProvider>(context, listen: false).setIndex(1);

    final shorterSide = MediaQuery.of(context).size.shortestSide;
    final padding = shorterSide * 0.04;

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
              child: buildFavoritesGrid('All Favorites', true, context, _showOverlay),
            ),
            SizedBox(height: padding),
            Expanded(
              child: buildFavoritesGrid('Personalized Favorite Lists', false, context, _showOverlay),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
