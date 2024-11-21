// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:funhub/view/nav/nav_bar.dart';
import 'view/onboard/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const MainNavigationScreen(),
    );
  }
}
