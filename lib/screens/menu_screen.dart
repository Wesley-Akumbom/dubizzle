import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../navigation/bottom_nav_bar.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Menu'),
        ),
        body: Center(
            child: Text('Menu Screen')
        ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
