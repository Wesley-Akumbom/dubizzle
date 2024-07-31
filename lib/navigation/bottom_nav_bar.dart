import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/navigation_provider.dart';
import '../routes.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: _buildPlaceAdButton(),
          label: 'Place Ad',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menu',
        ),
      ],
      currentIndex: navigationProvider.currentIndex,
      selectedItemColor: Colors.grey[800],
      onTap: (index) => _onItemTapped(index, context),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    Provider.of<NavigationProvider>(context, listen: false).setIndex(index);
    switch (index) {
      case 0:
        Navigator.pushNamed(context, AppRoutes.home);
        break;
      case 1:
        Navigator.pushNamed(context, AppRoutes.favorites);
        break;
      case 2:
        Navigator.pushNamed(context, AppRoutes.placeAd);
        break;
      case 3:
        Navigator.pushNamed(context, AppRoutes.chats);
        break;
      case 4:
        Navigator.pushNamed(context, AppRoutes.menu);
        break;
    }
  }

  Widget _buildPlaceAdButton() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}
