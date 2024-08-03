import 'package:dubizzle/provider/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes/routes.dart';

void main(){
  runApp(DubizzleApp());
}

class DubizzleApp extends StatelessWidget {
  const DubizzleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: MaterialApp(
        title: 'Dubizzle',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          cardColor: Colors.white,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white
          ),
        ),
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppRouter.generateRoute
      ),
    );
  }
}
