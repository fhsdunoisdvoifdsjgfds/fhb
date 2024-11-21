// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:funhub/view/home/main_screen.dart';
import 'package:funhub/view/nav/nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Widget> _pages = [
    const OnboardingPage(
      image: 'assets/images/onboarding1.png',
      title: 'PLAN THE PERFECT PARTY, EFFORTLESSLY!😉',
      description:
          'Explore games, cocktails, and everything you need for a memorable event.',
    ),
    const OnboardingPage(
      image: 'assets/images/onboarding2.png',
      title: 'ENDLESS FUN AWAITS🎉',
      description:
          'Explore a wide range of games to break the ice or keep the party going',
    ),
    const OnboardingPage(
      image: 'assets/images/onboarding3.png',
      title: 'MIX THE PERFECT COCKTAIL🍸',
      description: 'Find easy-to-follow recipes for classic and unique drinks.',
    ),
  ];

  void nextPage() {
    if (currentIndex < _pages.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) => _pages[index],
          ),
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: nextPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                currentIndex == _pages.length - 1 ? 'Start' : 'Next',
                style: GoogleFonts.bungee(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: GoogleFonts.bungee(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                description,
                textAlign: TextAlign.start,
                style: GoogleFonts.bungee(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(
              height: 200,
            ),
          ],
        ),
      ],
    );
  }
}
