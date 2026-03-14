import 'dart:async';

import 'package:flutter/material.dart';
import 'package:globalbridge/src/features/dashboard/presentation/pages/dashboard_home_page.dart';

class IdentityVerifiedPage extends StatelessWidget {
  const IdentityVerifiedPage({super.key});

  void _proceedToDashboard(BuildContext context) {
    unawaited(
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (_) => const DashboardHomePage(),
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
            center: const Alignment(0, -0.25),
            radius: 1.05,
            colors: [
              const Color(0xFF0D2A39).withValues(alpha: 0.9),
              const Color(0xFF031018),
              const Color(0xFF02080D),
            ],
            stops: const [0.0, 0.6, 1.0],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 390),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    const Spacer(flex: 2),
                    Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0x1FFFFFFF),
                        border: Border.all(color: const Color(0x22FFFFFF)),
                      ),
                      child: Center(
                        child: Container(
                          width: 82,
                          height: 82,
                          decoration: const BoxDecoration(
                            color: Color(0xFF37EA55),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xAA37EA55),
                                blurRadius: 28,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.check_rounded,
                            color: Color(0xFF05250B),
                            size: 56,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Identity Verified',
                      key: Key('identity_verified_title'),
                      style: TextStyle(
                        color: Color(0xFFE7ECF3),
                        fontSize: 44 * 0.78,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Your account is now fully\nactive.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF9EADBF),
                        fontSize: 18,
                        height: 1.4,
                      ),
                    ),
                    const Spacer(flex: 2),
                    InkWell(
                      key: const Key('identity_verified_proceed'),
                      onTap: () => _proceedToDashboard(context),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        height: 56,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xA40A1721),
                          border: Border.all(color: const Color(0x3A24CFE3)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x6624CFE3),
                              blurRadius: 22,
                              spreadRadius: -8,
                            ),
                            BoxShadow(
                              color: Color(0x5537EA55),
                              blurRadius: 26,
                              spreadRadius: -14,
                              offset: Offset(0, -2),
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Proceed to Dashboard',
                              style: TextStyle(
                                color: Color(0xFFE7ECF3),
                                fontSize: 22 * 0.72,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: Color(0xFFE7ECF3),
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      width: 128,
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0x334B6990),
                        borderRadius: BorderRadius.circular(999),
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
