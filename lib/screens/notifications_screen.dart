import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final size = MediaQuery.of(context).size;

    // Calculate responsive sizes
    final imageWidth = size.width * 0.7;
    final imageHeight = imageWidth * 0.8;
    final titleFontSize = size.width * 0.05;
    final subtitleFontSize = size.width * 0.035;
    final buttonWidth = size.width * 0.5;
    final buttonHeight = size.height * 0.06;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Notifications',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: titleFontSize,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Divider(thickness: 1),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/notif/no_notifications.jpg',
                    width: imageWidth,
                    height: imageHeight,
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'No notifications...yet!',
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: Text(
                      'View ad recommendations and news by dubizzle, etc...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: subtitleFontSize,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: OutlinedButton(
                      onPressed: () {
                        // Handle explore now action
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                      ),
                      child: Text(
                        'EXPLORE NOW',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: subtitleFontSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
