import 'package:flutter/material.dart';

class FeaturedListing extends StatelessWidget {
  final String title;

  const FeaturedListing(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    final shorterSide = MediaQuery.of(context).size.shortestSide;
    final fontSize = shorterSide * 0.03; // Reduced from 0.04 to 0.03

    return Card(
      margin: EdgeInsets.all(shorterSide * 0.015), // Reduced from 0.02
      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: fontSize)),
        subtitle: Text(
          'Description of the featured item',
          style: TextStyle(fontSize: fontSize * 0.8),
        ),
      ),
    );
  }
}
