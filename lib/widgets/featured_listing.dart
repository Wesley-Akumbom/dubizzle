import 'package:flutter/material.dart';

class FeaturedListing extends StatelessWidget {
  final String title;

  const FeaturedListing(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth * 0.04;

    return Card(
      margin: EdgeInsets.all(screenWidth * 0.02),
      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: fontSize)),
        subtitle: Text('Description of the featured item', style: TextStyle(fontSize: fontSize * 0.8)),
      ),
    );
  }
}
