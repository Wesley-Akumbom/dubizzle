import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../navigation/bottom_nav_bar.dart';
import '../provider/navigation_provider.dart';
import '../widgets/ProductSection.dart';
import '../widgets/category_card.dart';
import '../widgets/animated_search_bar.dart';
import '../widgets/product_card.dart';
import 'notifications_screen.dart';

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
                    Expanded(
                      child: AnimatedSearchBar(
                        onSearch: (query) {
                          print('Searching for: $query');
                        },
                      ),
                    ),
                    SizedBox(width: padding),
                    IconButton(
                      icon: const Icon(Icons.notifications),
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => const NotificationsScreen(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;
                              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);
                              return SlideTransition(position: offsetAnimation, child: child);
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: padding / 4,
                  crossAxisSpacing: padding / 4,
                  children: const [
                    CategoryCard('Property For Rent', Icons.home,),
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
              const ProductSection(
                title: 'Popular in Residential for rent',
                products: [
                  ProductCard(
                    title: 'Apartment 1',
                    description: 'Spacious 2BR apartment',
                    imagePath: 'assets/images/apartment1.jpg',
                  ),
                  ProductCard(
                    title: 'Villa 1',
                    description: 'Luxury 4BR villa with pool',
                    imagePath: 'assets/images/villa1.jpg',
                  ),
                  ProductCard(
                    title: 'Studio 1',
                    description: 'Cozy studio in downtown',
                    imagePath: 'assets/images/studio1.jpg',
                  ),
                  ProductCard(
                    title: 'Apartment 2',
                    description: 'Modern 3BR apartment',
                    imagePath: 'assets/images/apartment2.jpg',
                  ),
                  ProductCard(
                    title: 'Villa 2',
                    description: '5BR villa with garden',
                    imagePath: 'assets/images/villa2.jpg',
                  ),
                  ProductCard(
                    title: 'Studio 2',
                    description: 'Stylish studio near metro',
                    imagePath: 'assets/images/studio2.jpg',
                  ),
                ],
              ),
              const ProductSection(
                title: 'Popular in Cars',
                products: [
                  ProductCard(
                    title: 'Sedan 1',
                    description: 'Reliable family car',
                    imagePath: 'assets/images/sedan1.jpg',
                  ),
                  ProductCard(
                    title: 'SUV 1',
                    description: 'Spacious 7-seater SUV',
                    imagePath: 'assets/images/suv1.jpg',
                  ),
                  ProductCard(
                    title: 'Sports Car 1',
                    description: 'High-performance sports car',
                    imagePath: 'assets/images/sportscar1.jpg',
                  ),
                  ProductCard(
                    title: 'Sedan 2',
                    description: 'Fuel-efficient compact car',
                    imagePath: 'assets/images/sedan2.jpg',
                  ),
                  ProductCard(
                    title: 'SUV 2',
                    description: 'Luxury 5-seater SUV',
                    imagePath: 'assets/images/suv2.jpg',
                  ),
                  ProductCard(
                    title: 'Sports Car 2',
                    description: 'Classic sports car',
                    imagePath: 'assets/images/sportscar2.jpg',
                  ),
                ],
              ),
              const ProductSection(
                title: 'Popular in Computer and Networking',
                products: [
                  ProductCard(
                    title: 'Laptop 1',
                    description: 'High-performance laptop',
                    imagePath: 'assets/images/laptop1.jpg',
                  ),
                  ProductCard(
                    title: 'Router 1',
                    description: 'Fast Wi-Fi router',
                    imagePath: 'assets/images/router1.jpg',
                  ),
                  ProductCard(
                    title: 'Desktop 1',
                    description: 'Powerful desktop PC',
                    imagePath: 'assets/images/desktop1.jpg',
                  ),
                  ProductCard(
                    title: 'Laptop 2',
                    description: 'Ultralight business laptop',
                    imagePath: 'assets/images/laptop2.jpg',
                  ),
                  ProductCard(
                    title: 'Router 2',
                    description: 'Mesh Wi-Fi system',
                    imagePath: 'assets/images/router2.jpg',
                  ),
                  ProductCard(
                    title: 'Desktop 2',
                    description: 'Gaming desktop PC',
                    imagePath: 'assets/images/desktop2.jpg',
                  ),
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
