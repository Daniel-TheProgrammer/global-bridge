import 'dart:async';

import 'package:flutter/material.dart';
import 'package:globalbridge/src/features/auth/presentation/pages/email_otp_verification_page.dart';
import 'package:globalbridge/src/features/auth/presentation/pages/privacy_policy_page.dart';
import 'package:globalbridge/src/features/auth/presentation/pages/terms_of_service_page.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();

  bool _agreedToTerms = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _referralController.dispose();
    super.dispose();
  }

  Future<void> _openTerms() async {
    final accepted = await Navigator.of(context).push<bool>(
      MaterialPageRoute<bool>(
        builder: (_) => const TermsOfServicePage(),
      ),
    );
    if (accepted ?? false) {
      setState(() => _agreedToTerms = true);
    }
  }

  Future<void> _openPrivacy() async {
    await Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => const PrivacyPolicyPage(),
      ),
    );
  }

  void _onCreateAccount() {
    FocusScope.of(context).unfocus();
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    if (!_agreedToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept the terms to continue.')),
      );
      return;
    }

    unawaited(
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => EmailOtpVerificationPage(
            email: _emailController.text.trim(),
          ),
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
            center: const Alignment(0, -0.45),
            radius: 1.05,
            colors: [
              const Color(0xFF0E2B38).withValues(alpha: 0.95),
              const Color(0xFF04121B),
              const Color(0xFF030B12),
            ],
            stops: const [0.0, 0.62, 1.0],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 390),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            key: const Key('create_back'),
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Color(0xFFE7ECF3),
                            ),
                          ),
                          const Expanded(
                            child: Center(
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                  color: Color(0xFFE7ECF3),
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 48),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Center(
                        child: Icon(
                          Icons.blur_on_rounded,
                          size: 148,
                          color: const Color(0xFF00E5FF).withValues(alpha: 0.56),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Join GlobalBridge',
                        style: TextStyle(
                          color: Color(0xFFE7ECF3),
                          fontSize: 39,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.6,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Start generating premium 1-year virtual cards today.',
                        style: TextStyle(
                          color: Color(0xFF8498AD),
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 22),
                      _fieldLabel('Email Address'),
                      _textField(
                        fieldKey: const Key('create_email'),
                        controller: _emailController,
                        hint: 'name@example.com',
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          final email = (value ?? '').trim();
                          if (email.isEmpty) {
                            return 'Email is required';
                          }
                          final valid = RegExp(
                            r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                          ).hasMatch(email);
                          if (!valid) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),
                      _fieldLabel('Password'),
                      _textField(
                        fieldKey: const Key('create_password'),
                        controller: _passwordController,
                        hint: '*******',
                        obscureText: _obscurePassword,
                        textInputAction: TextInputAction.next,
                        suffix: IconButton(
                          onPressed: () {
                            setState(
                              () => _obscurePassword = !_obscurePassword,
                            );
                          },
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color(0x668FA3BA),
                            size: 18,
                          ),
                        ),
                        validator: (value) {
                          final password = value ?? '';
                          if (password.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          if (!RegExp('[A-Z]').hasMatch(password) ||
                              !RegExp('[0-9]').hasMatch(password)) {
                            return 'Use at least one uppercase letter '
                                'and number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),
                      _fieldLabel('Referral Code (Optional)'),
                      _textField(
                        fieldKey: const Key('create_referral_code'),
                        controller: _referralController,
                        hint: 'Enter code',
                        textInputAction: TextInputAction.done,
                        validator: (_) => null,
                      ),
                      const SizedBox(height: 24),
                      InkWell(
                        key: const Key('create_account_submit'),
                        onTap: _onCreateAccount,
                        child: Container(
                          height: 56,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFF24CFE3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Create Account',
                            style: TextStyle(
                              color: Color(0xFF03212B),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Text(
                              'By signing up, you agree to our ',
                              style: TextStyle(
                                color: Color(0xFF7D8FA6),
                                fontSize: 12,
                              ),
                            ),
                            TextButton(
                              key: const Key('read_terms'),
                              onPressed: () => unawaited(_openTerms()),
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text(
                                'Terms of Service',
                                style: TextStyle(
                                  color: Color(0xFF24CFE3),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const Text(
                              ' and ',
                              style: TextStyle(
                                color: Color(0xFF7D8FA6),
                                fontSize: 12,
                              ),
                            ),
                            TextButton(
                              key: const Key('read_privacy'),
                              onPressed: () => unawaited(_openPrivacy()),
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text(
                                'Privacy Policy',
                                style: TextStyle(
                                  color: Color(0xFF24CFE3),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(
                              color: Color(0xFF95A6BA),
                              fontSize: 14,
                            ),
                          ),
                          TextButton(
                            key: const Key('create_sign_in'),
                            onPressed: () => Navigator.of(context).pop(),
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                color: Color(0xFF24CFE3),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Expanded(child: Divider(color: Color(0x1A8FA3BA))),
                          SizedBox(width: 10),
                          Text(
                            'OR CONTINUE WITH',
                            style: TextStyle(
                              color: Color(0x667D8FA6),
                              fontSize: 11,
                              letterSpacing: 1.1,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(child: Divider(color: Color(0x1A8FA3BA))),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 48,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xAA040C13),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: const Color(0x1F8FA3BA)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.send_rounded,
                              size: 17,
                              color: Color(0xFF24CFE3),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Login with Telegram',
                              style: TextStyle(
                                color: Color(0xFFE7ECF3),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
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

  Widget _fieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFFC8D2DE),
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String hint,
    required String? Function(String?) validator,
    Key? fieldKey,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    bool obscureText = false,
    Widget? suffix,
  }) {
    return TextFormField(
      key: fieldKey,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      style: const TextStyle(
        color: Color(0xFFE7ECF3),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      cursorColor: const Color(0xFF24CFE3),
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0x191A7182),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintStyle: const TextStyle(
          color: Color(0x667D8FA6),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        errorStyle: const TextStyle(color: Color(0xFFFF9B9B), fontSize: 11),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0x268FA3BA)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0x9924CFE3)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0x99FF6B6B)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0x99FF6B6B)),
        ),
        suffixIcon: suffix,
      ),
    );
  }
}
