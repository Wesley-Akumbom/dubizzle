import 'package:flutter/material.dart';

import '../navigation/bottom_nav_bar.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shorterSide = MediaQuery.of(context).size.shortestSide;
    final padding = shorterSide * 0.05;
    final imageSize = shorterSide * 0.4;
    final fontSize = shorterSide * 0.04;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: shorterSide * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/empty_chat.png', // Ensure this image exists in your assets
                width: imageSize,
                height: imageSize,
              ),
              SizedBox(height: padding),
              Text(
                'Hey, looks like you don\'t have any chat messages yet.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: padding / 2),
              Text(
                'Connect with other dubizzlers for your next best deal!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize * 0.8,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
