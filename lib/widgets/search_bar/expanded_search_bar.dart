// lib/widgets/expanded_search_bar.dart

import 'package:flutter/material.dart';

class ExpandedSearchBar extends StatelessWidget {
  final VoidCallback onBack;
  final Function(String) onSearch;

  const ExpandedSearchBar({
    super.key,
    required this.onBack,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 48, // Fixed height for consistency
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: onBack,
          ),
          Expanded(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'What are you looking for?',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey[400]),
              ),
              style: const TextStyle(color: Colors.black, fontSize: 16),
              onSubmitted: onSearch,
            ),
          ),
        ],
      ),
    );
  }
}
