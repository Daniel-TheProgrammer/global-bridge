import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailOtpVerificationPage extends StatefulWidget {
  const EmailOtpVerificationPage({required this.email, super.key});

  final String email;

  @override
  State<EmailOtpVerificationPage> createState() =>
      _EmailOtpVerificationPageState();
}

class _EmailOtpVerificationPageState extends State<EmailOtpVerificationPage> {
  static const int _otpLength = 6;
  static const int _resendCooldown = 30;

  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;
  Timer? _timer;
  int _secondsRemaining = _resendCooldown;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(_otpLength, (_) => TextEditingController());
    _focusNodes = List.generate(_otpLength, (_) => FocusNode());
    _startCooldown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  bool get _isOtpComplete =>
      _controllers.every((controller) => controller.text.trim().isNotEmpty);

  String get _otpValue =>
      _controllers.map((controller) => controller.text).join();

  void _startCooldown() {
    _timer?.cancel();
    setState(() => _secondsRemaining = _resendCooldown);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining <= 1) {
        timer.cancel();
        if (mounted) {
          setState(() => _secondsRemaining = 0);
        }
        return;
      }
      if (mounted) {
        setState(() => _secondsRemaining--);
      }
    });
  }

  void _onOtpChanged(int index, String value) {
    final cleanValue = value.replaceAll(RegExp('[^0-9]'), '');
    if (cleanValue.isEmpty) {
      return;
    }
    _controllers[index].text = cleanValue.substring(cleanValue.length - 1);
    _controllers[index].selection = const TextSelection.collapsed(offset: 1);

    if (index < _otpLength - 1) {
      _focusNodes[index + 1].requestFocus();
    } else {
      _focusNodes[index].unfocus();
    }
    setState(() {});
  }

  void _verifyOtp() {
    FocusScope.of(context).unfocus();
    if (!_isOtpComplete) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter the full 6-digit code.')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('OTP verified: $_otpValue')),
    );
  }

  void _resendCode() {
    if (_secondsRemaining > 0) {
      return;
    }
    for (final controller in _controllers) {
      controller.clear();
    }
    _focusNodes.first.requestFocus();
    _startCooldown();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('A new verification code has been sent.')),
    );
  }

  String _maskEmail(String email) {
    final atIndex = email.indexOf('@');
    if (atIndex <= 1) {
      return email;
    }
    final name = email.substring(0, atIndex);
    final domain = email.substring(atIndex);
    final prefix = name.substring(0, 1);
    final suffix = name.substring(name.length - 1);
    return '$prefix${'*' * (name.length - 2)}$suffix$domain';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 0.85,
            colors: [Color(0xFF1A1A1D), Color(0xFF0F0F11)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 390),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFFE7ECF3),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Email Verification',
                      style: TextStyle(
                        color: Color(0xFFF1F5F9),
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.6,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'We sent a 6-digit code to ${_maskEmail(widget.email)}',
                      style: const TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(_otpLength, (index) {
                        return SizedBox(
                          width: 44,
                          child: TextField(
                            key: Key('otp_cell_$index'),
                            controller: _controllers[index],
                            focusNode: _focusNodes[index],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            autofillHints: const [AutofillHints.oneTimeCode],
                            style: const TextStyle(
                              color: Color(0xFFE7ECF3),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            cursorColor: const Color(0xFF00E5FF),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(1),
                            ],
                            decoration: const InputDecoration(
                              counterText: '',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x1AFFFFFF),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x9900E5FF),
                                ),
                              ),
                            ),
                            onChanged: (value) => _onOtpChanged(index, value),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        const Text(
                          "Didn't receive the code?",
                          style: TextStyle(
                            color: Color(0x99FFFFFF),
                            fontSize: 12,
                          ),
                        ),
                        TextButton(
                          key: const Key('otp_resend'),
                          onPressed: _secondsRemaining == 0
                              ? _resendCode
                              : null,
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            _secondsRemaining == 0
                                ? 'Resend'
                                : 'Resend in ${_secondsRemaining}s',
                            style: const TextStyle(
                              color: Color(0xFF00E5FF),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      key: const Key('otp_verify'),
                      onTap: _verifyOtp,
                      child: Container(
                        height: 56,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFF080808),
                          border: Border.all(
                            color: _isOtpComplete
                                ? const Color(0x4D00E1FF)
                                : const Color(0x33FFFFFF),
                          ),
                        ),
                        child: Text(
                          'VERIFY',
                          style: TextStyle(
                            color: _isOtpComplete
                                ? const Color(0xFF00E5FF)
                                : const Color(0x66FFFFFF),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
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
