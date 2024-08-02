import 'package:flutter/material.dart';

class SmallCategoryCard extends StatelessWidget {
  final String categoryName;
  final IconData icon;

  const SmallCategoryCard(this.categoryName, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    final shorterSide = MediaQuery.of(context).size.shortestSide;
    final iconSize = shorterSide * 0.06; // Reduced icon size
    final fontSize = shorterSide * 0.03; // Reduced font size

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(shorterSide * 0.02), // Reduced padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: iconSize, color: Colors.redAccent),
            SizedBox(height: shorterSide * 0.01),
            Text(
              categoryName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
