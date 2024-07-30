import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlaceAdScreen extends StatelessWidget {
  const PlaceAdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Place an Ad'),
        ),
        body: Center(
            child: Text('Place and Ad Screen')
        )
    );
  }
}
