import 'dart:async';

import 'package:flutter/material.dart';
import 'package:globalbridge/src/features/health/presentation/pages/home_page.dart';
import 'package:globalbridge/src/features/onboarding/presentation/pages/onboarding_slide_one_page.dart';
import 'package:globalbridge/src/features/onboarding/presentation/pages/onboarding_slide_three_page.dart';
import 'package:globalbridge/src/features/onboarding/presentation/pages/onboarding_slide_two_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _goToSecondSlide() async {
    await _pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> _goToThirdSlide() async {
    await _pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOutCubic,
    );
  }

  void _goToLogin() {
    unawaited(
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (_) => const HomePage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          OnboardingSlideOnePage(
            onNext: () => unawaited(_goToSecondSlide()),
            onSkip: _goToLogin,
          ),
          OnboardingSlideTwoPage(
            onContinue: () => unawaited(_goToThirdSlide()),
            onSkip: _goToLogin,
          ),
          OnboardingSlideThreePage(
            onGetStarted: _goToLogin,
            onSkip: _goToLogin,
          ),
        ],
      ),
    );
  }
}
