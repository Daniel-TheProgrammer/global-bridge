import 'dart:math' as math;

import 'package:flutter/material.dart';

class OnboardingSlideOnePage extends StatelessWidget {
  const OnboardingSlideOnePage({
    required this.onNext,
    required this.onSkip,
    super.key,
  });

  final VoidCallback onNext;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0A1213),
        gradient: RadialGradient(
          center: Alignment(0, 0.05),
          radius: 0.7,
          colors: [Color(0xFF0F474D), Color(0xFF051012), Color(0xFF031014)],
          stops: [0, 0.45, 1],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            _SlideOneHeader(onSkip: onSkip),
            const SizedBox(height: 24),
            const _SlideOneHero(),
            const SizedBox(height: 48),
            const _SlideOneBody(),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: _MainActionButton(text: 'Get Started', onTap: onNext),
            ),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}

class _SlideOneHeader extends StatelessWidget {
  const _SlideOneHeader({required this.onSkip});

  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Color(0xFF0DDBF2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.link_rounded,
              color: Color(0xFF0A1213),
              size: 18,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'GlobalBridge',
            style: TextStyle(
              color: Color(0xFFF1F5F9),
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.45,
              height: 28 / 18,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: onSkip,
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF0DDBF2),
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
            ),
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Color(0xFF0DDBF2),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SlideOneHero extends StatelessWidget {
  const _SlideOneHero();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 256,
            height: 256,
            decoration: const BoxDecoration(
              color: Color(0x330DDBF2),
              shape: BoxShape.circle,
            ),
          ),
          Transform.rotate(
            angle: -3 * math.pi / 180,
            child: Container(
              width: 340,
              height: 186.5,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0x330DDBF2)),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0x220DDBF2), Color(0x110DDBF2)],
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'VIRTUAL CARD GOLD',
                    style: TextStyle(
                      color: Color(0x990DDBF2),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 8),
                  _ChipBox(),
                  SizedBox(height: 6),
                  Text(
                    '* * * *   * * * *   * * * *   8 8 2 9',
                    style: TextStyle(
                      color: Color(0xFFF1F5F9),
                      fontSize: 14,
                      letterSpacing: 2.6,
                      fontFamily: 'monospace',
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CARD HOLDER',
                            style: TextStyle(
                              color: Color(0x660DDBF2),
                              fontSize: 8,
                              letterSpacing: 0.4,
                            ),
                          ),
                          Text(
                            'PREMIUM USER',
                            style: TextStyle(
                              color: Color(0xFFF1F5F9),
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.credit_card_outlined,
                        color: Color(0xFF0DDBF2),
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            right: 40,
            top: 20,
            child: _FloatingCircle(icon: Icons.public_outlined, size: 48),
          ),
          const Positioned(
            left: 40,
            bottom: 22,
            child: _FloatingCircle(icon: Icons.shield_outlined, size: 56),
          ),
        ],
      ),
    );
  }
}

class _SlideOneBody extends StatelessWidget {
  const _SlideOneBody();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Text(
            'Global Payments,\nSimplified.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFF1F5F9),
              fontSize: 30,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.75,
              height: 1.25,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Generate premium 1-year virtual cards for\n'
            'seamless international transactions and\n'
            'subscriptions.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 16,
              height: 26 / 16,
            ),
          ),
          SizedBox(height: 28),
          _SlideOneDots(),
        ],
      ),
    );
  }
}

class _SlideOneDots extends StatelessWidget {
  const _SlideOneDots();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 6,
          decoration: BoxDecoration(
            color: const Color(0xFF0DDBF2),
            borderRadius: BorderRadius.circular(999),
          ),
        ),
        const SizedBox(width: 8),
        const _Dot(color: Color(0xFF334155)),
        const SizedBox(width: 8),
        const _Dot(color: Color(0xFF334155)),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _ChipBox extends StatelessWidget {
  const _ChipBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0x4D0DDBF2)),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0x660DDBF2), Color(0x1A0DDBF2)],
        ),
      ),
    );
  }
}

class _FloatingCircle extends StatelessWidget {
  const _FloatingCircle({required this.icon, required this.size});

  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0x220DDBF2),
        border: Border.all(color: const Color(0x660DDBF2)),
      ),
      child: Icon(icon, color: const Color(0xFF0DDBF2), size: size * 0.42),
    );
  }
}

class _MainActionButton extends StatelessWidget {
  const _MainActionButton({required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 64,
        decoration: BoxDecoration(
          color: const Color(0xFF0DDBF2),
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Color(0x330DDBF2),
              blurRadius: 15,
              offset: Offset(0, 10),
              spreadRadius: -3,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Color(0xFF102022),
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 24 / 16,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward, color: Color(0xFF102022), size: 18),
          ],
        ),
      ),
    );
  }
}
