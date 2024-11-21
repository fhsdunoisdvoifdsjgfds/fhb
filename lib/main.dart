import 'package:flutter/material.dart';
import 'package:funhub/view/nav/nav_bar.dart';
import 'view/onboard/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: MainNavigationScreen(),
    );
  }
}
