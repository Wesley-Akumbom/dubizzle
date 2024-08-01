import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../navigation/bottom_nav_bar.dart';
import '../provider/navigation_provider.dart';
import '../widgets/category_card.dart';
import '../widgets/featured_listing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NavigationProvider>(context, listen: false).setIndex(0);
    });

    final shorterSide = MediaQuery.of(context).size.shortestSide;
    final padding = shorterSide * 0.04;

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
                      icon: Icon(Icons.notifications),
                      onPressed: () {
                        // Handle notification button press
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,1,10,1),
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
                        offset: Offset(0, 2),
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
                              fontSize: shorterSide * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: padding),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: padding,
                                vertical: padding / 2),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'NEW',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: shorterSide * 0.03,
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
                        label: const Text('Explore Now',
                            style: TextStyle(color: Colors.black)),
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
                physics: NeverScrollableScrollPhysics(),
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
