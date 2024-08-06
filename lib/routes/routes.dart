import 'package:dubizzle/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:dubizzle/screens/chats_screen.dart';
import 'package:dubizzle/screens/favorites_screen.dart';
import 'package:dubizzle/screens/home_screen.dart';
import 'package:dubizzle/screens/menu_screen.dart';
import 'package:dubizzle/screens/place_ad_screen.dart';

class AppRoutes{
  static const String auth = '/auth';
  static const String home = '/home';
  static const String favorites = '/favorites';
  static const String placeAd = '/placeAd';
  static const String chats = '/chats';
  static const String menu = '/menu';
}

class AppRouter {
  static Route <dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case AppRoutes.auth:
        return MaterialPageRoute(builder: (_) => AuthScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.favorites:
        return MaterialPageRoute(builder: (_) => const FavoritesScreen());
      case AppRoutes.placeAd:
        return MaterialPageRoute(builder: (_) => const PlaceAdScreen());
      case AppRoutes.chats:
        return MaterialPageRoute(builder: (_) => const ChatsScreen());
      case AppRoutes.menu:
        return MaterialPageRoute(builder: (_) => const MenuScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

    }
  }
}