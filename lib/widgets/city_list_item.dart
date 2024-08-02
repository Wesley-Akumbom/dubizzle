import 'package:flutter/material.dart';

class CityListItem extends StatelessWidget {
  final String cityName;
  final VoidCallback onTap;

  const CityListItem(this.cityName, {super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final shorterSide = MediaQuery.of(context).size.shortestSide;
    final fontSize = shorterSide * 0.04;
    final padding = shorterSide * 0.03;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding / 2),
      child: ListTile(
        title: Text(
          cityName,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
