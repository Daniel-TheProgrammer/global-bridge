import 'package:flutter/material.dart';

class DashboardHomePage extends StatelessWidget {
  const DashboardHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0, -0.45),
            radius: 1.15,
            colors: [
              const Color(0xFF0E2B38).withValues(alpha: 0.94),
              const Color(0xFF04121B),
              const Color(0xFF030A10),
            ],
            stops: const [0.0, 0.62, 1.0],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 390),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'WELCOME BACK,',
                                      style: TextStyle(
                                        color: Color(0xFF8B9AAD),
                                        fontSize: 13,
                                        letterSpacing: 0.8,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      'Alexander',
                                      style: TextStyle(
                                        color: Color(0xFFE7ECF3),
                                        fontSize: 42 * 0.72,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: const Color(0x221A7182),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: const Color(0x338FA3BA),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.account_circle_outlined,
                                  color: Color(0xFFAAB8CA),
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          const Text(
                            'Total Balance  #',
                            style: TextStyle(
                              color: Color(0xFF8B9AAD),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                r'$',
                                style: TextStyle(
                                  color: Color(0xFF24CFE3),
                                  fontSize: 42 * 0.62,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                '0.00',
                                style: TextStyle(
                                  color: Color(0xFFE7ECF3),
                                  fontSize: 52 * 0.72,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 22),
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  'MY VIRTUAL CARD',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xFF8B9AAD),
                                    fontSize: 32 * 0.56,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.4,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0x1A24CFE3),
                                      borderRadius: BorderRadius.circular(999),
                                      border: Border.all(
                                        color: const Color(0x3324CFE3),
                                      ),
                                    ),
                                    child: const Text(
                                      'Expiry: 365 Days',
                                      style: TextStyle(
                                        color: Color(0xFF24CFE3),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            key: const Key('dashboard_card_panel'),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: const Color(0x268FA3BA),
                              ),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0x152B3F52), Color(0x12233445)],
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 112,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF042534),
                                        Color(0xFF071825),
                                      ],
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      const Positioned(
                                        left: 18,
                                        top: 16,
                                        child: Text(
                                          'GLOBALBRIDGE',
                                          style: TextStyle(
                                            color: Color(0xB324CFE3),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 1.5,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 18,
                                        bottom: 18,
                                        child: Text(
                                          '****    ****    ****',
                                          style: TextStyle(
                                            color: Color(0x66E7ECF3),
                                            fontSize: 14,
                                            letterSpacing: 1.4,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          width: 54,
                                          height: 54,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF24CFE3),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.lock_outline,
                                            color: Color(0xFF03212B),
                                            size: 26,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Container(
                                  height: 52,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF24CFE3),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add_circle_outline,
                                        color: Color(0xFF03212B),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Top Up',
                                        style: TextStyle(
                                          color: Color(0xFF03212B),
                                          fontSize: 30 * 0.72,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    Expanded(
                                      child: _actionButton(
                                        icon: Icons.remove_red_eye_outlined,
                                        label: 'Reveal',
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: _actionButton(
                                        icon: Icons.settings_outlined,
                                        label: 'Settings',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'QUICK ACCESS',
                            style: TextStyle(
                              color: Color(0xFF8B9AAD),
                              fontSize: 32 * 0.56,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.4,
                            ),
                          ),
                          const SizedBox(height: 14),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _QuickAccessTile(
                                icon: Icons.movie_filter_outlined,
                                label: 'Netflix',
                                iconColor: Color(0xFFFF4D4D),
                              ),
                              _QuickAccessTile(
                                icon: Icons.work_outline,
                                label: 'ChatGPT',
                                iconColor: Color(0xFF20D8A8),
                              ),
                              _QuickAccessTile(
                                icon: Icons.shopping_bag_outlined,
                                label: 'App Store',
                                iconColor: Color(0xFF24CFE3),
                              ),
                              _QuickAccessTile(
                                icon: Icons.public,
                                label: 'Google',
                                iconColor: Color(0xFF3B8BFF),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    key: const Key('dashboard_bottom_nav'),
                    padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
                    decoration: BoxDecoration(
                      color: const Color(0xB6030D14),
                      border: Border(
                        top: BorderSide(
                          color: const Color(
                            0x338FA3BA,
                          ).withValues(alpha: 0.24),
                        ),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _NavItem(icon: Icons.home, label: 'Home', active: true),
                        _NavItem(
                          icon: Icons.credit_card_outlined,
                          label: 'Cards',
                          active: false,
                        ),
                        _NavItem(
                          icon: Icons.sync_alt_outlined,
                          label: 'Payments',
                          active: false,
                        ),
                        _NavItem(
                          icon: Icons.person_outline,
                          label: 'Profile',
                          active: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _actionButton({required IconData icon, required String label}) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFF1A283C),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0x2B8FA3BA)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFFC9D6E3), size: 18),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFFD5DFEA),
              fontSize: 22 * 0.63,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickAccessTile extends StatelessWidget {
  const _QuickAccessTile({
    required this.icon,
    required this.label,
    required this.iconColor,
  });

  final IconData icon;
  final String label;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 78,
      child: Column(
        children: [
          Container(
            width: 62,
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xFF1A283C),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0x2B8FA3BA)),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF95A6BA),
              fontSize: 14 * 0.7,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.active,
  });

  final IconData icon;
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final color = active ? const Color(0xFF24CFE3) : const Color(0xFF6E8099);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 11,
            fontWeight: active ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
