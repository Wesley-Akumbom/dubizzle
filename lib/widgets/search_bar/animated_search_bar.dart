// lib/widgets/animated_search_bar.dart

import 'package:flutter/material.dart';
import 'dart:async';
import 'expanded_search_bar.dart'; // Import the ExpandedSearchBar

class AnimatedSearchBar extends StatefulWidget {
  final Function(String) onSearch;

  const AnimatedSearchBar({super.key, required this.onSearch});

  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  final List<Map<String, dynamic>> _categories = [
    {'icon': Icons.home, 'name': 'Properties'},
    {'icon': Icons.car_rental, 'name': 'Cars'},
    {'icon': Icons.phone_android, 'name': 'Electronics'},
    {'icon': Icons.work, 'name': 'Jobs'},
    {'icon': Icons.chair, 'name': 'Furniture'},
  ];

  int _currentIndex = 0;
  late Timer _timer;
  bool _isSearchActive = false;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _categories.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isSearchActive
        ? ExpandedSearchBar(
      onBack: () {
        setState(() {
          _isSearchActive = false;
        });
      },
      onSearch: widget.onSearch,
    )
        : GestureDetector(
      onTap: () {
        setState(() {
          _isSearchActive = true;
        });
      },
      child: Container(
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
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Icon(
                _categories[_currentIndex]['icon'],
                key: ValueKey<int>(_currentIndex),
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Search for ${_categories[_currentIndex]['name']}',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
