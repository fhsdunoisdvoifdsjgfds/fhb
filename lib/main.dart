import 'package:flutter/material.dart';
import 'package:funhub/view/nav/nav_bar.dart';
import 'package:funhub/view/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view/onboard/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _checkOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding_completed') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: FutureBuilder(
        future: Future.wait([
          Future.delayed(const Duration(milliseconds: 3500)),
          _checkOnboardingStatus(),
        ]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          }

          final bool onboardingCompleted = snapshot.data?[1] ?? false;
          return onboardingCompleted
              ? const MainNavigationScreen()
              : const OnboardingScreen();
        },
      ),
    );
  }
}
