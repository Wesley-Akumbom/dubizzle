import 'package:flutter/material.dart';
import 'product_card.dart';

class ProductSection extends StatelessWidget {
  final String title;
  final List<ProductCard> products;

  const ProductSection({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(size.width * 0.04),
          child: Text(
            title,
            style: TextStyle(
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.25, // Adjust as needed
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...products,
              _buildViewAllButton(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildViewAllButton(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.3,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_forward, color: Colors.white),
              onPressed: () {
                // Handle view all products for this category
              },
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            'View All',
            style: TextStyle(
              fontSize: size.width * 0.03,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
