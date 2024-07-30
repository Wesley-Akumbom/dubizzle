import 'package:dubizzle/pages/chats.dart';
import 'package:dubizzle/pages/favorites.dart';
import 'package:dubizzle/pages/home.dart';
import 'package:dubizzle/pages/menu.dart';
import 'package:dubizzle/pages/place_an_ad.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/home': (context) => Home(),
      '/favorites': (context) => Favorites(),
      '/place-an-ad': (context) => PlaceAnAd(),
      '/chats': (context) => Chats(),
      '/menu': (context) => Menu()
    },
  ));
}
