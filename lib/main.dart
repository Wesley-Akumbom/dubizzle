import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/home': (context) => Home(),
      '/favorites': (context) => Favorites(),
      '/place-an-ad': (context) => PlaceAnAd(),
      '/chats': (context) => Menu(),
      '/menu': (context) => Menu()
    },
  ));
}
