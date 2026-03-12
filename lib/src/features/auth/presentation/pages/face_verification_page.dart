import 'dart:async';

import 'package:flutter/material.dart';
import 'package:globalbridge/src/features/auth/presentation/pages/card_activation_page.dart';

class FaceVerificationPage extends StatelessWidget {
  const FaceVerificationPage({super.key});

  void _completePhaseTwo(BuildContext context) {
    unawaited(
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (_) => const CardActivationPage(),
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _roundButton(
                            key: const Key('face_verification_close'),
                            icon: Icons.close,
                            onTap: () => Navigator.of(context).pop(),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    'KYC PHASE 2',
                                    style: TextStyle(
                                      color: Color(0xFF00E5FF),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1.6,
                                    ),
                                  ),
                                  Text(
                                    'Identity Verification',
                                    style: TextStyle(
                                      color: Color(0xFFE7ECF3),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 52),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Center(
                        child: _scanRing(
                          child: Icon(
                            Icons.portrait,
                            size: 210,
                            color: const Color(
                              0xFFE7ECF3,
                            ).withValues(alpha: 0.55),
                          ),
                        ),
                      ),
                      const SizedBox(height: 26),
                      const Center(
                        child: Text(
                          'Hold steady for 3D scan',
                          style: TextStyle(
                            color: Color(0xFFE7ECF3),
                            fontSize: 38 * 0.7,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Center(
                        child: Text(
                          'Position your face within the frame\n'
                          'and follow the on-screen prompts',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF9EADBF),
                            fontSize: 18,
                            height: 1.35,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      InkWell(
                        key: const Key('face_verification_complete'),
                        onTap: () => _completePhaseTwo(context),
                        borderRadius: BorderRadius.circular(18),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: const Color(0x1A0E1E2C),
                            border: Border.all(color: const Color(0x1F8FA3BA)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    'SCANNING...',
                                    style: TextStyle(
                                      color: Color(0xFF00E5FF),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1.1,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '65%',
                                    style: TextStyle(
                                      color: Color(0xFFE7ECF3),
                                      fontSize: 42 * 0.63,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(999),
                                child: SizedBox(
                                  height: 6,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 65,
                                        child: Container(
                                          color: const Color(0xFF24CFE3),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 35,
                                        child: Container(
                                          color: const Color(0x33495F79),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 18),
                              Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: const Color(0x110E1A25),
                                  border: Border.all(
                                    color: const Color(0x1F8FA3BA),
                                  ),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.wb_sunny_outlined,
                                      color: Color(0xFF24CFE3),
                                      size: 20,
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        "Pro Tip\nEnsure you're in a well-lit "
                                        'environment for faster verification.',
                                        style: TextStyle(
                                          color: Color(0xFFD3DDEA),
                                          fontSize: 14,
                                          height: 1.35,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
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
      ),
    );
  }

  Widget _scanRing({required Widget child}) {
    return SizedBox(
      width: 330,
      height: 330,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 330,
            height: 330,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF00E5FF), width: 3),
            ),
          ),
          Container(
            width: 302,
            height: 302,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xCC00E5FF), width: 2),
            ),
          ),
          Container(
            width: 284,
            height: 284,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0x12000000),
              border: Border.all(color: const Color(0x33FFFFFF)),
            ),
            child: Center(child: child),
          ),
          _frameCorner(alignment: Alignment.topLeft),
          _frameCorner(alignment: Alignment.topRight),
          _frameCorner(alignment: Alignment.bottomLeft),
          _frameCorner(alignment: Alignment.bottomRight),
        ],
      ),
    );
  }

  Widget _frameCorner({required Alignment alignment}) {
    final top =
        alignment == Alignment.topLeft || alignment == Alignment.topRight;
    final left =
        alignment == Alignment.topLeft || alignment == Alignment.bottomLeft;
    return Align(
      alignment: alignment,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          border: Border(
            top: top
                ? const BorderSide(color: Color(0xFF00E5FF), width: 3)
                : BorderSide.none,
            left: left
                ? const BorderSide(color: Color(0xFF00E5FF), width: 3)
                : BorderSide.none,
            right: !left
                ? const BorderSide(color: Color(0xFF00E5FF), width: 3)
                : BorderSide.none,
            bottom: !top
                ? const BorderSide(color: Color(0xFF00E5FF), width: 3)
                : BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _roundButton({
    required IconData icon,
    required VoidCallback onTap,
    Key? key,
  }) {
    return InkWell(
      key: key,
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xCC111820),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(icon, color: const Color(0xFFE7ECF3), size: 22),
      ),
    );
  }
}
