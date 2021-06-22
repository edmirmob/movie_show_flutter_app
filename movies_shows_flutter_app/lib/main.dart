import 'package:flutter/material.dart';

import 'locator.dart';
import 'routes.dart';
import 'ui/home/dashboard_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: DashboardScreen(),
      routes: routes,
    );
  }
}
