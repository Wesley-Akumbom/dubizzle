import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../navigation/bottom_nav_bar.dart';
import '../provider/navigation_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NavigationProvider>(context, listen: false).setIndex(0); // Use appropriate index for each screen
    });

    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth * 0.04;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(padding),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: padding),
                    IconButton(
                      icon: const Icon(Icons.notifications),
                      onPressed: () {
                        // Handle notification button press
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(padding, padding / 2, padding, padding / 4),
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: padding / 4,
                  crossAxisSpacing: padding / 4,
                  children: const [
                    CategoryCard('Property For Rent', Icons.home),
                    CategoryCard('Property For Sale', Icons.sell),
                    CategoryCard('Off-Plan Properties', Icons.architecture),
                    CategoryCard('Rooms For Rent', Icons.hotel),
                    CategoryCard('Motors', Icons.directions_car),
                    CategoryCard('Jobs', Icons.work),
                    CategoryCard('Classifieds', Icons.category),
                    CategoryCard('Furniture & Garden', Icons.chair),
                    CategoryCard('Community', Icons.people),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padding),
                child: Container(
                  padding: EdgeInsets.all(padding),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Introducing New Projects',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: padding),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'NEW',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: padding),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle explore now button press
                        },
                        label: const Text('Explore Now', style: TextStyle(color: Colors.black)),
                        icon: const Icon(Icons.arrow_forward),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[200],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  FeaturedListing('Featured Item 1'),
                  FeaturedListing('Featured Item 2'),
                  FeaturedListing('Featured Item 3'),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final IconData icon;

  const CategoryCard(this.categoryName, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth * 0.1;
    final fontSize = screenWidth * 0.03;

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: iconSize, color: Colors.redAccent),
          SizedBox(height: screenWidth * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: Text(
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
          ),
        ],
      ),
    );
  }
}

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
