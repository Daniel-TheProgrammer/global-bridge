import 'package:flutter/material.dart';

class SecurityVaultPage extends StatelessWidget {
  const SecurityVaultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0, -0.55),
            radius: 1.2,
            colors: [
              const Color(0xFF0E2B38).withValues(alpha: 0.95),
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
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              _HeaderIconButton(
                                buttonKey: const Key('security_vault_back'),
                                icon: Icons.arrow_back_ios_new,
                                onTap: () => Navigator.of(context).pop(),
                              ),
                              const Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'SECURITY VAULT',
                                      key: Key('security_vault_title'),
                                      style: TextStyle(
                                        color: Color(0xFFDCE5F2),
                                        fontSize: 24 * 0.72,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      '• SECURE CONNECTION',
                                      style: TextStyle(
                                        color: Color(0xFF00E5FF),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.7,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const _HeaderIconButton(icon: Icons.lock_outline),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const _VaultCard(),
                          const SizedBox(height: 18),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0x1A203446),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: const Color(0x338FA3BA),
                              ),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.verified_user_outlined,
                                  size: 16,
                                  color: Color(0xFF24CFE3),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Credentials decrypted successfully',
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color(0xFFD2DFEC),
                                      fontSize: 15 * 0.72,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                          _VaultActionTile(
                            tileKey: const Key('security_vault_copy_card'),
                            icon: Icons.content_copy_outlined,
                            label: 'Copy Card Number',
                            status: 'READY',
                            onTap: () => _showCopiedMessage(
                              context,
                              message: 'Card number copied.',
                            ),
                          ),
                          const SizedBox(height: 12),
                          _VaultActionTile(
                            tileKey: const Key('security_vault_copy_cvv'),
                            icon: Icons.shield_outlined,
                            label: 'Copy CVV',
                            status: 'SECURE',
                            onTap: () => _showCopiedMessage(
                              context,
                              message: 'CVV copied.',
                            ),
                          ),
                          const SizedBox(height: 12),
                          _VaultActionTile(
                            tileKey: const Key('security_vault_view_zip'),
                            icon: Icons.location_on_outlined,
                            label: 'View Billing ZIP',
                            trailingIcon: Icons.chevron_right,
                            onTap: () => _showCopiedMessage(
                              context,
                              message: 'Billing ZIP: 10001',
                            ),
                          ),
                          const SizedBox(height: 130),
                          const Center(
                            child: Text(
                              'DETAILS WILL BE HIDDEN AUTOMATICALLY AFTER 54\n'
                              'SECONDS FOR YOUR SECURITY.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0x668FA3BA),
                                fontSize: 11,
                                height: 1.45,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    key: const Key('security_vault_bottom_nav'),
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
                          icon: Icons.history,
                          label: 'History',
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

  void _showCopiedMessage(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}

class _VaultCard extends StatelessWidget {
  const _VaultCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('security_vault_card'),
      width: double.infinity,
      height: 218,
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF23D4E9), Color(0xFF1B8BDA), Color(0xFF1A58CE)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'GLOBALBRIDGE',
                      style: TextStyle(
                        color: Color(0xB3EAF6FF),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.4,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Virtual Black Edition',
                      style: TextStyle(
                        color: Color(0xE6EAF6FF),
                        fontSize: 20 * 0.62,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(color: const Color(0x99EAF6FF), width: 2),
                ),
                child: const Icon(
                  Icons.contactless_rounded,
                  color: Color(0xFFEAF6FF),
                  size: 18,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Text(
            '4532881099240081',
            key: Key('security_vault_card_number'),
            style: TextStyle(
              color: Color(0xFFF2FAFF),
              fontSize: 36 * 0.68,
              letterSpacing: 3,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 18),
          const Row(
            children: [
              _CardMeta(label: 'EXPIRY', value: '08/25'),
              SizedBox(width: 30),
              _CardMeta(label: 'CVV', value: '942'),
              Spacer(),
              _MastercardLogo(),
            ],
          ),
        ],
      ),
    );
  }
}

class _CardMeta extends StatelessWidget {
  const _CardMeta({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0x99EAF6FF),
            fontSize: 10,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.7,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFFF2FAFF),
            fontSize: 24 * 0.62,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}

class _MastercardLogo extends StatelessWidget {
  const _MastercardLogo();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 56,
      height: 30,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 8,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Color(0xFFD34B65),
            ),
          ),
          Positioned(
            left: 26,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Color(0xFFD0B143),
            ),
          ),
        ],
      ),
    );
  }
}

class _VaultActionTile extends StatelessWidget {
  const _VaultActionTile({
    required this.tileKey,
    required this.icon,
    required this.label,
    required this.onTap,
    this.status,
    this.trailingIcon,
  });

  final Key tileKey;
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final String? status;
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: tileKey,
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 66,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: const Color(0x1A203446),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0x338FA3BA)),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFFA9B9CD), size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: Color(0xFFD3DFEC),
                  fontSize: 28 * 0.63,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (status != null)
              Text(
                status!,
                style: const TextStyle(
                  color: Color(0xFF00E5FF),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
            if (trailingIcon != null)
              Icon(trailingIcon, color: const Color(0x887F92AA), size: 18),
          ],
        ),
      ),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  const _HeaderIconButton({
    required this.icon,
    this.onTap,
    this.buttonKey,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final Key? buttonKey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: buttonKey,
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: const Color(0x1A203446),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: const Color(0x338FA3BA)),
        ),
        child: Icon(icon, color: const Color(0xFFD2DFEC), size: 20),
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
