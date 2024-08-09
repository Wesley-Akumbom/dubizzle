import 'package:flutter/material.dart';
import 'package:dubizzle/screens/auth_screen.dart';
import 'package:dubizzle/screens/chats_screen.dart';
import 'package:dubizzle/screens/favorites_screen.dart';
import 'package:dubizzle/screens/home_screen.dart';
import 'package:dubizzle/screens/menu_screen.dart';
import 'package:dubizzle/screens/place_ad_screen.dart';

class AppRoutes {
  static const String auth = '/auth';
  static const String home = '/home';
  static const String favorites = '/favorites';
  static const String placeAd = '/placeAd';
  static const String chats = '/chats';
  static const String menu = '/menu';
}

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    Widget screen;
    bool canPop = false;

    switch (settings.name) {
      case AppRoutes.auth:
        screen = AuthScreen();
        // Auth screen can be popped (to close the app)
        canPop = true;
      case AppRoutes.home:
        screen = const HomeScreen();
        // Home screen can be popped (to close the app)
        canPop = true;
      case AppRoutes.favorites:
        screen = const FavoritesScreen();
      case AppRoutes.placeAd:
        screen = const PlaceAdScreen();
      case AppRoutes.chats:
        screen = const ChatsScreen();
      case AppRoutes.menu:
        screen = const MenuScreen();
      default:
      // If an unknown route is requested, redirect to the home screen
        screen = const HomeScreen();
        canPop = true;
    }

    return MaterialPageRoute(
      builder: (_) => PopScope(
        canPop: canPop,
        onPopInvoked: (didPop) {
          if (didPop) return;
          if (canPop) {
            // For AuthScreen and HomeScreen, this will allow the app to be closed
            Navigator.of(_).pop();
          } else {
            // For other screens, navigate to the home screen
            Navigator.of(_).pushReplacementNamed(AppRoutes.home);
          }
        },
        child: screen,
      ),
    );
  }
}