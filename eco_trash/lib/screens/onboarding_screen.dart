import 'package:flutter/material.dart';
import '../models/onboarding_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      imagePath:
          'assets/onboarding1.png', // Make sure to add the images in assets
      title: 'Selamat Datang',
      description:
          'Bersama-sama kita menciptakan lingkungan yang lebih bersih dan lebih hijau.',
    ),
    OnboardingItem(
      imagePath: 'assets/onboarding2.png',
      title: 'Penyerahan Sampah dengan Mudah',
      description:
          'Meminta penjemputan sampah atau mengantar ke tempat pengumpulan.',
    ),
    OnboardingItem(
      imagePath: 'assets/onboarding3.png',
      title: 'Tukarkan Poin dengan Hadiah',
      description:
          'Kumpulkan poin dari pengantaran sampah dan tukarkan dengan hadiah menarik.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onSkip() {
    Navigator.pushReplacementNamed(
        context, '/login'); // Navigate to Login screen
  }

  void _onNext() {
    if (_currentPage == _onboardingItems.length - 1) {
      _onSkip();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onBack() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Skip Button
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: _onSkip,
                child: const Text('Lewati'),
              ),
            ),
            // PageView (similar to ViewPager2)
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingItems.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        _onboardingItems[index].imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 250,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        _onboardingItems[index].title,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _onboardingItems[index].description,
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            // Navigation Buttons (Back, Next)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0)
                  TextButton(
                    onPressed: _onBack,
                    child: const Text('Sebelumnya'),
                  ),
                ElevatedButton(
                  onPressed: _onNext,
                  child: Text(_currentPage == _onboardingItems.length - 1
                      ? 'Mulai'
                      : 'Selanjutnya'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
