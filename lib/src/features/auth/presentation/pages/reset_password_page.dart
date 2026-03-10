import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onResetPassword() {
    FocusScope.of(context).unfocus();
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password reset successfully.')),
    );
    Navigator.of(context).pop();
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        key: const Key('reset_password_back'),
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFFE7ECF3),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Reset Password',
                        style: TextStyle(
                          color: Color(0xFFF1F5F9),
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.6,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Set a new password for your account securely.',
                        style: TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 28),
                      _fieldLabel('EMAIL ADDRESS'),
                      _textField(
                        fieldKey: const Key('reset_email'),
                        controller: _emailController,
                        hint: 'name@globalbridge.com',
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
                      _fieldLabel('NEW PASSWORD'),
                      _textField(
                        fieldKey: const Key('reset_new_password'),
                        controller: _newPasswordController,
                        hint: '••••••••••••',
                        obscureText: _obscureNewPassword,
                        textInputAction: TextInputAction.next,
                        suffix: IconButton(
                          onPressed: () {
                            setState(
                              () => _obscureNewPassword = !_obscureNewPassword,
                            );
                          },
                          icon: Icon(
                            _obscureNewPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color(0x66FFFFFF),
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
                      _fieldLabel('CONFIRM NEW PASSWORD'),
                      _textField(
                        fieldKey: const Key('reset_confirm_password'),
                        controller: _confirmPasswordController,
                        hint: '••••••••••••',
                        obscureText: _obscureConfirmPassword,
                        textInputAction: TextInputAction.done,
                        suffix: IconButton(
                          onPressed: () {
                            setState(
                              () => _obscureConfirmPassword =
                                  !_obscureConfirmPassword,
                            );
                          },
                          icon: Icon(
                            _obscureConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color(0x66FFFFFF),
                            size: 18,
                          ),
                        ),
                        validator: (value) {
                          if (value != _newPasswordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 28),
                      InkWell(
                        key: const Key('reset_password_submit'),
                        onTap: _onResetPassword,
                        child: Container(
                          height: 56,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFF080808),
                            border: Border.all(color: const Color(0x4D00E1FF)),
                          ),
                          child: const Text(
                            'RESET PASSWORD',
                            style: TextStyle(
                              color: Color(0xFF00E5FF),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                            ),
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

  Widget _fieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0x66FFFFFF),
          fontSize: 10,
          fontWeight: FontWeight.w500,
          letterSpacing: 1,
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
        color: Color(0xB3FFFFFF),
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
      cursorColor: const Color(0xFF00E5FF),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color(0x33FFFFFF),
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
        errorStyle: const TextStyle(color: Color(0xFFFF9B9B), fontSize: 11),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0x1AFFFFFF)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0x9900E5FF)),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0x99FF6B6B)),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0x99FF6B6B)),
        ),
        suffixIcon: suffix,
      ),
    );
  }
}
