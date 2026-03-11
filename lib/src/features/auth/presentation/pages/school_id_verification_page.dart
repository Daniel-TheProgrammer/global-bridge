import 'dart:async';

import 'package:flutter/material.dart';
import 'package:globalbridge/src/features/auth/presentation/pages/card_activation_page.dart';

class SchoolIdVerificationPage extends StatelessWidget {
  const SchoolIdVerificationPage({super.key});

  void _goToCardActivation(BuildContext context) {
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
            center: const Alignment(0, -0.25),
            radius: 1.1,
            colors: [
              const Color(0xFF0E2A39).withValues(alpha: 0.92),
              const Color(0xFF031019),
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
                  children: [
                    Row(
                      children: [
                        _circleIconButton(
                          key: const Key('school_id_close'),
                          icon: Icons.close,
                          onTap: () => Navigator.of(context).pop(),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Identity Verification',
                              style: TextStyle(
                                color: Color(0xFFE7ECF3),
                                fontSize: 30 * 0.63,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        _circleIconButton(
                          icon: Icons.help_outline,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Align your document inside the frame.',
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 38),
                    const Text(
                      'Center your document',
                      style: TextStyle(
                        color: Color(0xFFE7ECF3),
                        fontSize: 30 * 0.73,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'School ID or SNILS',
                      style: TextStyle(
                        color: Color(0xFF96A3B7),
                        fontSize: 30 * 0.58,
                      ),
                    ),
                    const SizedBox(height: 22),
                    _documentFrame(),
                    const Spacer(),
                    _captureButton(),
                    const SizedBox(height: 22),
                    InkWell(
                      key: const Key('school_id_upload_gallery'),
                      onTap: () => _goToCardActivation(context),
                      borderRadius: BorderRadius.circular(28),
                      child: Container(
                        width: double.infinity,
                        height: 54,
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                          color: const Color(0x10273744),
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(color: const Color(0x2B8FA3BA)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.photo_library_outlined,
                              color: Color(0xFFBFCBDC),
                              size: 20,
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                'Upload from Gallery',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFE0E6EF),
                                  fontSize: 30 * 0.62,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 128,
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0x334B6990),
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _documentFrame() {
    return Container(
      width: double.infinity,
      height: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0A1523), Color(0x88050F18), Color(0x22050F18)],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3300E5FF),
            blurRadius: 30,
            spreadRadius: -18,
            offset: Offset(0, -6),
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Icon(
              Icons.blur_on_rounded,
              size: 210,
              color: const Color(0xFFDFE6EE).withValues(alpha: 0.22),
            ),
          ),
          _corner(alignment: Alignment.topLeft),
          _corner(alignment: Alignment.topRight),
          _corner(alignment: Alignment.bottomLeft),
          _corner(alignment: Alignment.bottomRight),
        ],
      ),
    );
  }

  Widget _corner({required Alignment alignment}) {
    final top =
        alignment == Alignment.topLeft || alignment == Alignment.topRight;
    final left =
        alignment == Alignment.topLeft || alignment == Alignment.bottomLeft;
    return Align(
      alignment: alignment,
      child: Container(
        width: 42,
        height: 42,
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
          boxShadow: const [
            BoxShadow(
              color: Color(0x8000E5FF),
              blurRadius: 12,
              spreadRadius: -4,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: top && left ? const Radius.circular(12) : Radius.zero,
            topRight: top && !left ? const Radius.circular(12) : Radius.zero,
            bottomLeft: !top && left ? const Radius.circular(12) : Radius.zero,
            bottomRight: !top && !left
                ? const Radius.circular(12)
                : Radius.zero,
          ),
        ),
      ),
    );
  }

  Widget _captureButton() {
    return Container(
      key: const Key('school_id_capture'),
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0x66FFFFFF), width: 2),
      ),
      child: Center(
        child: Container(
          width: 66,
          height: 66,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFF2F4F8),
          ),
        ),
      ),
    );
  }

  Widget _circleIconButton({
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
