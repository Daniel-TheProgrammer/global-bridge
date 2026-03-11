import 'dart:async';

import 'package:flutter/material.dart';
import 'package:globalbridge/src/features/auth/presentation/pages/school_id_verification_page.dart';

class KycVerificationPage extends StatelessWidget {
  const KycVerificationPage({required this.email, super.key});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0, -0.1),
            radius: 1.05,
            colors: [
              const Color(0xFF0E2B38).withValues(alpha: 0.92),
              const Color(0xFF030B12),
              const Color(0xFF02070C),
            ],
            stops: const [0.0, 0.62, 1.0],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 390),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 20,
                            color: Color(0xFFE7ECF3),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(999),
                              child: SizedBox(
                                width: 120,
                                height: 5,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: const Color(0xFF00E5FF),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: const Color(0xFF20395F),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Verify Your Identity',
                      style: TextStyle(
                        color: Color(0xFFE7ECF3),
                        fontSize: 46 * 0.82,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.6,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Choose a document to verify your account.'
                      '${email.isNotEmpty ? '' : ''}',
                      style: const TextStyle(
                        color: Color(0xFF8FA3BA),
                        fontSize: 30 * 0.6,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 26),
                    _IdentityCard(
                      cardKey: const Key('kyc_id_type_school'),
                      icon: Icons.badge_outlined,
                      title: 'School ID',
                      subtitle: 'Official student identification',
                      onTap: () {
                        unawaited(
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) => const SchoolIdVerificationPage(),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 14),
                    _IdentityCard(
                      cardKey: const Key('kyc_id_type_snils'),
                      icon: Icons.description_outlined,
                      title: 'SNILS',
                      subtitle:
                          'Insurance Number of Individual\nLedger Account',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('SNILS flow will be available next.'),
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0x0800E5FF),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: const Color(0x1A8FA3BA)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1D2D45),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const Icon(
                              Icons.help_outline,
                              color: Color(0xFF9FB3C8),
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Need help?',
                                  style: TextStyle(
                                    color: Color(0xFFE7ECF3),
                                    fontSize: 28 * 0.58,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Contact our support team for\nassistance',
                                  style: TextStyle(
                                    color: Color(0xFF8FA3BA),
                                    fontSize: 28 * 0.47,
                                    height: 1.35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'Chat',
                            style: TextStyle(
                              color: Color(0xFF00E5FF),
                              fontSize: 28 * 0.6,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: Container(
                        width: 128,
                        height: 4,
                        decoration: BoxDecoration(
                          color: const Color(0x334B6990),
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
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

class _IdentityCard extends StatelessWidget {
  const _IdentityCard({
    required this.cardKey,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final Key cardKey;
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: cardKey,
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: const Color(0x223193A8)),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0x1600CBE8), Color(0x0E2A1236), Color(0x20511B6A)],
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFF052B37),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0x443193A8)),
              ),
              child: Icon(icon, color: const Color(0xFF00E5FF), size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFFE7ECF3),
                      fontSize: 30 * 0.64,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xFF6F88A7),
                      fontSize: 30 * 0.47,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Color(0xFF6F88A7),
              size: 26,
            ),
          ],
        ),
      ),
    );
  }
}
