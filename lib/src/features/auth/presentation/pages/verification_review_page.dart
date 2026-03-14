import 'dart:async';

import 'package:flutter/material.dart';
import 'package:globalbridge/src/features/auth/presentation/pages/identity_verified_page.dart';

class VerificationReviewPage extends StatelessWidget {
  const VerificationReviewPage({super.key});

  void _goToIdentityVerified(BuildContext context) {
    unawaited(
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (_) => const IdentityVerifiedPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0, -0.2),
            radius: 1.08,
            colors: [
              const Color(0xFF0D2A39).withValues(alpha: 0.95),
              const Color(0xFF031018),
              const Color(0xFF02080D),
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
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          key: const Key('verification_review_close'),
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(
                            Icons.close,
                            color: Color(0xFFE7ECF3),
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'VERIFICATION',
                              style: TextStyle(
                                color: Color(0xFFD6DFEA),
                                fontSize: 22 * 0.7,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.8,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
                    const SizedBox(height: 38),
                    Center(
                      child: Container(
                        width: 130,
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: const Color(0x338FA3BA)),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0x263A4A5E), Color(0x16233445)],
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 58,
                            height: 58,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF24CFE3),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x9924CFE3),
                                  blurRadius: 22,
                                  spreadRadius: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 46),
                    const Center(
                      child: Text(
                        'Review in Progress',
                        key: Key('verification_review_title'),
                        style: TextStyle(
                          color: Color(0xFFE7ECF3),
                          fontSize: 44 * 0.78,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Center(
                      child: Text(
                        'Our systems are verifying your\n'
                        'data. Estimated time: < 3 mins.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF9EADBF),
                          fontSize: 17,
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Column(
                      children: [
                        Row(
                          children: [
                            _StepDot(active: true),
                            Expanded(child: _StepLine(active: true)),
                            _StepDot(active: true),
                            Expanded(child: _StepLine(active: false)),
                            _StepDot(active: false),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'IDENTITY',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color(0xFF24CFE3),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'REVIEW',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF24CFE3),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'READY',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0x667D8FA6),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      key: const Key('verification_review_notify'),
                      onTap: () => _goToIdentityVerified(context),
                      borderRadius: BorderRadius.circular(22),
                      child: Container(
                        height: 56,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: const Color(0x338FA3BA)),
                          gradient: const LinearGradient(
                            colors: [Color(0x1F2B3D4B), Color(0x18233445)],
                          ),
                        ),
                        child: const Text(
                          'Notify me when finished',
                          style: TextStyle(
                            color: Color(0xFF24CFE3),
                            fontSize: 30 * 0.66,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
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

class _StepDot extends StatelessWidget {
  const _StepDot({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? const Color(0xFF24CFE3) : const Color(0x334B6990),
      ),
    );
  }
}

class _StepLine extends StatelessWidget {
  const _StepLine({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 2,
      color: active ? const Color(0xFF24CFE3) : const Color(0x334B6990),
    );
  }
}
