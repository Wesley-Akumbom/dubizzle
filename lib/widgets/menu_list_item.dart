import 'package:flutter/material.dart';

class MenuListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? iconColor; // New parameter for icon color

  const MenuListItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor, // Default is null
  });

  @override
  Widget build(BuildContext context) {
    final shorterSide = MediaQuery.of(context).size.shortestSide;
    final fontSize = shorterSide * 0.04;
    final iconSize = shorterSide * 0.06;

    return ListTile(
      leading: Icon(icon, size: iconSize, color: iconColor ?? Colors.grey[600]), // Use iconColor if provided
      title: Text(
        title,
        style: TextStyle(fontSize: fontSize),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: iconSize * 0.8, color: Colors.grey[400]),
      onTap: onTap,
    );
  }
}
