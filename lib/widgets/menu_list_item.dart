import 'package:flutter/material.dart';

class MenuListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? iconColor;
  final bool showTrailing; // New parameter to control the trailing icon

  const MenuListItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor,
    this.showTrailing = true, // Default to true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shorterSide = MediaQuery.of(context).size.shortestSide;
    final iconSize = shorterSide * 0.06;

    return ListTile(
      leading: Icon(icon, size: iconSize, color: iconColor ?? Colors.grey[600]),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: showTrailing
          ? Icon(Icons.arrow_forward_ios, size: iconSize * 0.8, color: Colors.grey[400])
          : null, // Show trailing icon based on the parameter
      onTap: onTap,
    );
  }
}