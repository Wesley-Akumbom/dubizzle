import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../navigation/bottom_nav_bar.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chats'),
        ),
        body: Center(
            child: Text('Chats Screen',
        )
    ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
