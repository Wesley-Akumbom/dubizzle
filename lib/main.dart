import 'package:flutter/material.dart';
import 'routes.dart';

void main(){
  runApp(DubizzleApp());
}

class DubizzleApp extends StatelessWidget {
  const DubizzleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dubizzle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRouter.generateRoute
    );
  }
}
