import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _rememberMe = false;
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
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
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 390),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  _buildBrandHeader(),
                  const SizedBox(height: 62),
                  _buildInputSection(),
                  const SizedBox(height: 24),
                  _buildRememberMe(),
                  const SizedBox(height: 48),
                  _buildLoginButton(),
                  const SizedBox(height: 24),
                  _buildDividerLabel(),
                  const SizedBox(height: 24),
                  _buildTelegramButton(),
                  const Spacer(),
                  _buildSignup(),
                  const SizedBox(height: 56),
                  _buildFooter(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBrandHeader() {
    return const Center(
      child: Column(
        children: [
          Row(
            children: [
              _LogoMark(),
              SizedBox(width: 12),
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'GLOBALBRIDGE',
                    style: TextStyle(
                      color: Color(0xFFF2F2F7),
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 3.6,
                      height: 1.33,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'A DIGITAL SERVICE CONCIERGE',
            style: TextStyle(
              color: Color(0x66FFFFFF),
              fontSize: 10,
              letterSpacing: 3,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'EMAIL ADDRESS',
          style: TextStyle(
            color: Color(0x66FFFFFF),
            fontSize: 10,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 45,
          child: TextField(
            controller: _emailController,
            focusNode: _emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            style: const TextStyle(
              color: Color(0xB3FFFFFF),
              fontSize: 16,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.8,
            ),
            cursorColor: const Color(0xFF00E5FF),
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(bottom: 15, top: 14),
              border: InputBorder.none,
              hintText: 'name@globalbridge.com',
              hintStyle: TextStyle(
                color: Color(0x33FFFFFF),
                fontSize: 16,
                fontWeight: FontWeight.w300,
                letterSpacing: 0.8,
              ),
            ),
          ),
        ),
        const Divider(color: Color(0x1AFFFFFF), height: 1),
        const SizedBox(height: 32),
        Row(
          children: [
            const Text(
              'PASSWORD',
              style: TextStyle(
                color: Color(0x66FFFFFF),
                fontSize: 10,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                height: 1.5,
              ),
            ),
            const Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                foregroundColor: const Color(0xCC00E5FF),
              ),
              onPressed: () {},
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Color(0xCC00E5FF),
                  fontSize: 10,
                  letterSpacing: -0.25,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 45,
          child: TextField(
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            textInputAction: TextInputAction.done,
            obscureText: _obscurePassword,
            style: const TextStyle(
              color: Color(0xB3FFFFFF),
              fontSize: 16,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.8,
            ),
            cursorColor: const Color(0xFF00E5FF),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.only(bottom: 15, top: 14),
              border: InputBorder.none,
              hintText: '••••••••••••',
              hintStyle: const TextStyle(
                color: Color(0x33FFFFFF),
                fontSize: 16,
                fontWeight: FontWeight.w300,
                letterSpacing: 0.8,
              ),
              suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                splashRadius: 18,
                onPressed: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  size: 16,
                  color: const Color(0x66FFFFFF),
                ),
              ),
            ),
          ),
        ),
        const Divider(color: Color(0x1AFFFFFF), height: 1),
      ],
    );
  }

  Widget _buildRememberMe() {
    return InkWell(
      onTap: () => setState(() => _rememberMe = !_rememberMe),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0x33FFFFFF)),
              borderRadius: BorderRadius.circular(2),
              color: _rememberMe ? const Color(0xFF00E5FF) : Colors.transparent,
            ),
            child: _rememberMe
                ? const Icon(Icons.check, size: 12, color: Colors.black)
                : null,
          ),
          const SizedBox(width: 12),
          const Text(
            'Remember Me',
            style: TextStyle(
              color: Color(0x80FFFFFF),
              fontSize: 11,
              letterSpacing: 0.275,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
        final email = _emailController.text.trim();
        final password = _passwordController.text;
        if (email.isEmpty || password.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Enter email and password to continue.'),
            ),
          );
        }
      },
      child: Container(
        height: 56,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF080808),
          border: Border.all(color: const Color(0x4D00E1FF)),
        ),
        child: const Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF00E5FF),
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 2.4,
            height: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _buildDividerLabel() {
    return const Row(
      children: [
        Expanded(child: Divider(color: Color(0x0DFFFFFF))),
        SizedBox(width: 16),
        Text(
          'OR CONTINUE WITH',
          style: TextStyle(
            color: Color(0x33FFFFFF),
            fontSize: 9,
            letterSpacing: 1.8,
            height: 1.5,
          ),
        ),
        SizedBox(width: 16),
        Expanded(child: Divider(color: Color(0x0DFFFFFF))),
      ],
    );
  }

  Widget _buildTelegramButton() {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0x05FFFFFF),
        border: Border.all(color: const Color(0x0DFFFFFF)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: const BoxDecoration(
              color: Color(0xFF29A9EA),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.send_rounded,
              color: Colors.white,
              size: 11,
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Login with Telegram',
            style: TextStyle(
              color: Color(0xB3FFFFFF),
              fontSize: 11,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.55,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignup() {
    return Center(
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'New to GlobalBridge? ',
              style: TextStyle(
                color: Color(0x4DFFFFFF),
                fontSize: 11,
                letterSpacing: 0.275,
                height: 1.5,
              ),
            ),
            TextSpan(
              text: 'Create an account',
              style: TextStyle(
                color: Color(0x99FFFFFF),
                fontSize: 11,
                letterSpacing: 0.275,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return const Center(
      child: Column(
        children: [
          SizedBox(width: 128, child: Divider(color: Color(0x0DFFFFFF))),
          SizedBox(height: 8),
          Text(
            'PREMIUM FINTECH INFRASTRUCTURE',
            style: TextStyle(
              color: Color(0x1AFFFFFF),
              fontSize: 8,
              letterSpacing: 3.2,
              height: 1.5,
            ),
          ),
          SizedBox(height: 16),
          _BottomGrabber(),
        ],
      ),
    );
  }
}

class _LogoMark extends StatelessWidget {
  const _LogoMark();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56.57,
      height: 56.57,
      child: Center(
        child: Transform.rotate(
          angle: 0.785398,
          child: Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0x33F2F2F7)),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Transform.rotate(
              angle: -0.785398,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xE6F2F2F7),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomGrabber extends StatelessWidget {
  const _BottomGrabber();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128,
      height: 4,
      decoration: BoxDecoration(
        color: const Color(0x1AFFFFFF),
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }
}
