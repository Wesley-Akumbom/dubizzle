import 'package:dubizzle/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/navigation_provider.dart';
import '../routes/routes.dart';
import '../screens/place_ad_screen.dart';
import '../transitions/custom_route_transitions.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth * 0.07;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: iconSize),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite, size: iconSize),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: _buildPlaceAdButton(iconSize),
          label: 'Place Ad',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat, size: iconSize),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu, size: iconSize),
          label: 'Menu',
        ),
      ],
      currentIndex: navigationProvider.currentIndex,
      selectedItemColor: Colors.grey[850],
      onTap: (index) => _onItemTapped(index, context),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context, listen: false);
    navigationProvider.setIndex(index);

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, AppRoutes.home);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, AppRoutes.favorites);
        break;
      case 2:
        Navigator.push(context, SlideUpRoute(page: const PlaceAdScreen()));
        break;
      case 3:
        Navigator.pushReplacementNamed(context, AppRoutes.chats);
        break;
      case 4:
        Navigator.push(context, SlideLeftRoute(page: const MenuScreen()));
        break;
    }
  }


  Widget _buildPlaceAdButton(double iconSize) {
    return Container(
      width: iconSize * 1.5,
      height: iconSize * 1.5,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: iconSize,
      ),
    );
  }
}
