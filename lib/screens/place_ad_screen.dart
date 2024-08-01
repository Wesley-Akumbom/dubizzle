import 'package:flutter/material.dart';
import '../transitions/custom_route_transitions.dart';
import '../widgets/city_list_item.dart';
import 'home_screen.dart';

class PlaceAdScreen extends StatelessWidget {
  const PlaceAdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shorterSide = MediaQuery.of(context).size.shortestSide;
    final padding = shorterSide * 0.04;
    final titleFontSize = shorterSide * 0.05;
    final subtitleFontSize = shorterSide * 0.04;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, size: titleFontSize),
          onPressed: () {
            Navigator.pushReplacement(context, SlideDownRoute(page: const HomeScreen()));
          },
        ),
        title: Text(
          'Select a City',
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Where should we place your ad?',
              style: TextStyle(
                fontSize: subtitleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: padding),
            Expanded(
              child: ListView(
                children: const [
                  CityListItem('New York'),
                  Divider(height: 2,),
                  CityListItem('Los Angeles'),
                  Divider(height: 2,),
                  CityListItem('Chicago'),
                  Divider(height: 2,),
                  CityListItem('Houston'),
                  Divider(height: 2,),
                  CityListItem('Phoenix'),
                  Divider(height: 2,),
                  CityListItem('Philadelphia'),
                  Divider(height: 2,),
                  CityListItem('San Antonio'),
                  Divider(height: 2,),
                  CityListItem('San Diego'),
                  Divider(height: 2,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
