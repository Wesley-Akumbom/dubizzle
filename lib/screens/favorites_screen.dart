import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../navigation/bottom_nav_bar.dart';
import '../provider/navigation_provider.dart';
import '../widgets/grid_builder.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

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
              child: buildGrid('All Favorites', true, context),
            ),
            SizedBox(height: padding),
            Expanded(
              child: buildGrid('Personalized Favorite Lists', false, context),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
