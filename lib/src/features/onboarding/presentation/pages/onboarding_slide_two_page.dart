import 'package:flutter/material.dart';

class OnboardingSlideTwoPage extends StatelessWidget {
  const OnboardingSlideTwoPage({
    required this.onContinue,
    required this.onSkip,
    super.key,
  });

  final VoidCallback onContinue;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF102022),
        gradient: RadialGradient(
          center: Alignment(-0.2, 0.25),
          radius: 0.95,
          colors: [Color(0xFF0B3840), Color(0xFF071B20), Color(0xFF06171A)],
          stops: [0, 0.5, 1],
        ),
      ),
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      children: [
                        const Spacer(),
                        TextButton(
                          onPressed: onSkip,
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xCC0DDBF2),
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text(
                            'Skip',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: _SlideTwoHero(),
                  ),
                  const SizedBox(height: 32),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: _SlideTwoBody(),
                  ),
                  const SizedBox(height: 24),
                  const _SlideTwoDots(),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: _MainActionButton(
                      text: 'Continue',
                      onTap: onContinue,
                    ),
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SlideTwoHero extends StatelessWidget {
  const _SlideTwoHero();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 434.5,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0x1A0DDBF2)),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0x330DDBF2), Color(0x000DDBF2), Color(0x0D0DDBF2)],
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 256,
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0x1AFFFFFF)),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x990F172A), Color(0x660F172A)],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 47,
                    top: 79,
                    child: Container(
                      width: 160,
                      height: 160,
                      decoration: const BoxDecoration(
                        color: Color(0x4D0DDBF2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Divider(
                      color: Color(0xFF0DDBF2),
                      thickness: 2,
                      height: 2,
                    ),
                  ),
                  const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: Color(0xFF0DDBF2),
                          size: 58,
                        ),
                        SizedBox(height: 24),
                        Text(
                          '365',
                          style: TextStyle(
                            color: Color(0xFFF1F5F9),
                            fontSize: 60,
                            fontWeight: FontWeight.w700,
                            height: 1,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'DAYS ACTIVE',
                          style: TextStyle(
                            color: Color(0xFF0DDBF2),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            right: 40,
            top: 40,
            child: _FloatingCircle(icon: Icons.all_inclusive_rounded, size: 48),
          ),
          Positioned(
            left: 38,
            bottom: 44,
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0x0DFFFFFF)),
                color: const Color(0x99233455),
              ),
              child: const Icon(
                Icons.restart_alt_rounded,
                color: Color(0xFF0DDBF2),
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SlideTwoBody extends StatelessWidget {
  const _SlideTwoBody();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'One Card.\n365 Days of Freedom.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFF1F5F9),
            fontSize: 30,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.75,
            height: 1.25,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Experience the power of a virtual card\n'
          'that lasts as long as your ambitions. No\n'
          'monthly renewals, just pure financial flow.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF94A3B8),
            fontSize: 16,
            height: 26 / 16,
          ),
        ),
      ],
    );
  }
}

class _SlideTwoDots extends StatelessWidget {
  const _SlideTwoDots();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _Dot(color: Color(0x330DDBF2)),
        SizedBox(width: 12),
        _Pill(),
        SizedBox(width: 12),
        _Dot(color: Color(0x330DDBF2)),
        SizedBox(width: 12),
        _Dot(color: Color(0x330DDBF2)),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 6,
      decoration: BoxDecoration(
        color: const Color(0xFF0DDBF2),
        borderRadius: BorderRadius.circular(999),
      ),
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
