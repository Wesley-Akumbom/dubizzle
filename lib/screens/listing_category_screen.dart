import 'package:flutter/material.dart';
import '../widgets/small_category_card.dart';

class ListingCategoryScreen extends StatelessWidget {
  const ListingCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shorterSide = MediaQuery.of(context).size.shortestSide;
    final fontSize = shorterSide * 0.04;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Text(
                  'What are you listing?',
                  style: TextStyle(
                      fontWeight:FontWeight.bold ,
                      fontSize: fontSize,
                  )),
              const Text(
                'Choose the category that your ad fits into',
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: const [
                    SmallCategoryCard('Motors', Icons.directions_car),
                    SmallCategoryCard('Jobs', Icons.work),
                    SmallCategoryCard('Property for Sale', Icons.sell),
                    SmallCategoryCard('Property for Rent', Icons.home),
                    SmallCategoryCard('Community', Icons.people),
                    SmallCategoryCard('Classifieds', Icons.category),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
