import 'package:flutter/material.dart';

Widget buildGrid(String title, bool isDefault, BuildContext context) {
  final shorterSide = MediaQuery.of(context).size.shortestSide;
  final titleFontSize = shorterSide * 0.0375; // Reduced from 0.05 to 0.0375
  final iconSize = shorterSide * 0.075; // Reduced from 0.1 to 0.075
  final padding = shorterSide * 0.015; // Reduced from 0.02 to 0.015

  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 0,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(padding),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (isDefault) ...[
                SizedBox(width: padding),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: padding, vertical: padding / 2),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'DEFAULT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: titleFontSize * 0.6,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: isDefault
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite_border,
                    size: iconSize, color: Colors.grey),
                SizedBox(height: padding),
                Text('You have no favorites saved on this list',
                    style: TextStyle(fontSize: titleFontSize * 0.8)),
                Text(
                    'Use the favorite icon to save ads that you want to check later.',
                    style: TextStyle(fontSize: titleFontSize * 0.6)),
              ],
            )
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite,
                    size: iconSize, color: Colors.blue),
                SizedBox(height: padding),
                Text('Create your personalized list',
                    style: TextStyle(fontSize: titleFontSize * 0.8)),
                Text('Organize your favorites',
                    style: TextStyle(fontSize: titleFontSize * 0.6)),
                SizedBox(height: padding),
                ElevatedButton(
                  onPressed: () {
                    // Handle "Make A List" button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle:
                    TextStyle(fontSize: titleFontSize * 0.6),
                  ),
                  child: const Text('Make A List'),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
