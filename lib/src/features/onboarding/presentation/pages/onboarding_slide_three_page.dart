import 'package:flutter/material.dart';

class OnboardingSlideThreePage extends StatelessWidget {
  const OnboardingSlideThreePage({
    required this.onGetStarted,
    required this.onSkip,
    super.key,
  });

  final VoidCallback onGetStarted;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF070D12),
        gradient: RadialGradient(
          center: Alignment(0, -0.4),
          radius: 0.9,
          colors: [Color(0xFF0C3037), Color(0xFF061218), Color(0xFF050A0F)],
          stops: [0, 0.45, 1],
        ),
      ),
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 6),
                    _Header(onSkip: onSkip),
                    const SizedBox(height: 16),
                    const _HeroCard(),
                    const SizedBox(height: 28),
                    const _TextSection(),
                    const SizedBox(height: 18),
                    const _ProgressDots(),
                    const SizedBox(height: 28),
                    _GetStartedButton(onTap: onGetStarted),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.onSkip});

  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Row(
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
            color: Color(0xFF091319),
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
            foregroundColor: const Color(0xCC0DDBF2),
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            'Skip',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 436,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF153E47), Color(0xFF123944), Color(0xFF102D37)],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x800DDBF2),
            blurRadius: 80,
            spreadRadius: -24,
            offset: Offset(0, 18),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 16,
            right: 16,
            top: 20,
            bottom: 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const RadialGradient(
                  center: Alignment(0, -0.2),
                  radius: 1.05,
                  colors: [
                    Color(0xFF184A58),
                    Color(0xFF0F2F38),
                    Color(0xFF0B2028),
                  ],
                  stops: [0, 0.6, 1],
                ),
              ),
            ),
          ),
          Positioned(
            top: 42,
            right: 42,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
              decoration: BoxDecoration(
                color: const Color(0xFF22D3EE),
                borderRadius: BorderRadius.circular(999),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.wallet_giftcard_outlined,
                    color: Color(0xFF04242B),
                    size: 14,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '0% FEES',
                    style: TextStyle(
                      color: Color(0xFF04242B),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            top: 130,
            child: Transform.rotate(
              angle: -0.06,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0x3A0E2430),
                  border: Border.all(color: const Color(0x4D5FC6D8)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.account_balance_wallet_outlined,
                                color: Color(0xFF0DDBF2),
                                size: 18,
                              ),
                              SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  'VIRTUAL HOLDER',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0x99B2D3DB),
                                    fontSize: 9,
                                    letterSpacing: 0.6,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'PREMIUM',
                          style: TextStyle(
                            color: Color(0x99B2D3DB),
                            fontSize: 10,
                            letterSpacing: 1,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'MARCUS GOLDMAN',
                      style: TextStyle(
                        color: Color(0xFFF1F5F9),
                        fontSize: 33 / 1.65,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 32,
            right: 32,
            bottom: 58,
            child: Container(
              height: 14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xAA000000),
                    blurRadius: 20,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TextSection extends StatelessWidget {
  const _TextSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'First top-up is on us.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFF1F5F9),
            fontSize: 44 / 1.6,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.6,
            height: 1.2,
          ),
        ),
        Text(
          'No hidden fees.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF00E5FF),
            fontSize: 44 / 1.6,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.6,
            height: 1.2,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Experience total transparency with\n'
          'GlobalBridge. Generate your 1-year virtual\n'
          'card today and enjoy your first deposit for\n'
          'free.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFAAB7CC),
            fontSize: 16,
            height: 1.45,
          ),
        ),
      ],
    );
  }
}

class _ProgressDots extends StatelessWidget {
  const _ProgressDots();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _Dot(color: Color(0xFF233D58)),
        const SizedBox(width: 10),
        const _Dot(color: Color(0xFF233D58)),
        const SizedBox(width: 10),
        Container(
          width: 24,
          height: 6,
          decoration: BoxDecoration(
            color: const Color(0xFF0DDBF2),
            borderRadius: BorderRadius.circular(999),
          ),
        ),
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

class _GetStartedButton extends StatelessWidget {
  const _GetStartedButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: const Key('onboarding3_get_started'),
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        height: 82,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF24D0E3),
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Color(0x6624D0E3),
              blurRadius: 30,
              spreadRadius: -10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Get Started',
              style: TextStyle(
                color: Color(0xFF08151A),
                fontSize: 34 / 1.8,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.arrow_forward, color: Color(0xFF08151A), size: 22),
          ],
        ),
      ),
    );
  }
}
