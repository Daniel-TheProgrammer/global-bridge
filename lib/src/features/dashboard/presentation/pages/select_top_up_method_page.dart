import 'package:flutter/material.dart';

class SelectTopUpMethodPage extends StatelessWidget {
  const SelectTopUpMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0, -0.45),
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          key: const Key('top_up_method_back'),
                          onTap: () => Navigator.of(context).pop(),
                          borderRadius: BorderRadius.circular(20),
                          child: const SizedBox(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.arrow_back,
                              color: Color(0xFFE7ECF3),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Select Method',
                              key: Key('top_up_method_title'),
                              style: TextStyle(
                                color: Color(0xFFE7ECF3),
                                fontSize: 30 * 0.72,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 40),
                      ],
                    ),
                    const SizedBox(height: 22),
                    Center(
                      child: Container(
                        key: const Key('top_up_method_amount_badge'),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 9,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0x1A24CFE3),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(color: const Color(0x6624CFE3)),
                        ),
                        child: const Text(
                          '1,425.00 RUB',
                          style: TextStyle(
                            color: Color(0xFF24CFE3),
                            fontSize: 30 * 0.66,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'PAYMENT METHODS',
                      style: TextStyle(
                        color: Color(0xFF6F88A7),
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.4,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const _PaymentMethodTile(
                      tileKey: Key('top_up_method_bank_card'),
                      icon: Icons.credit_card_outlined,
                      title: 'Bank Card',
                      subtitle: 'MIR / Visa / Mastercard',
                    ),
                    const SizedBox(height: 12),
                    const _PaymentMethodTile(
                      tileKey: Key('top_up_method_sbp'),
                      icon: Icons.account_balance_wallet_outlined,
                      title: 'SBP Quick Payment',
                      subtitle: 'Instant via app transfer',
                    ),
                    const SizedBox(height: 12),
                    const _PaymentMethodTile(
                      tileKey: Key('top_up_method_usdt'),
                      icon: Icons.currency_bitcoin,
                      title: 'USDT (TRC20)',
                      subtitle: 'Crypto Settlement',
                      badgeText: 'FAST',
                    ),
                    const SizedBox(height: 12),
                    const _PaymentMethodTile(
                      tileKey: Key('top_up_method_bank_transfer'),
                      icon: Icons.account_balance_outlined,
                      title: 'Local Bank Transfer',
                      subtitle: 'Tinkoff / T-Bank',
                    ),
                    const Spacer(),
                    const Center(
                      child: Text(
                        'SOPHISTICATED GLOBAL BANKING\n'
                        'SECURE ENCRYPTED TRANSACTIONS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0x667D8FA6),
                          fontSize: 13,
                          height: 1.5,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Container(
                        width: 130,
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

class _PaymentMethodTile extends StatelessWidget {
  const _PaymentMethodTile({
    required this.tileKey,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.badgeText,
  });

  final Key tileKey;
  final IconData icon;
  final String title;
  final String subtitle;
  final String? badgeText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: tileKey,
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$title selected')),
        );
      },
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 84,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0x141A283C),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0x2B8FA3BA)),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFFAAB8CA), size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFFE7ECF3),
                            fontSize: 34 * 0.62,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (badgeText != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF24CFE3),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            badgeText!,
                            style: const TextStyle(
                              color: Color(0xFF03212B),
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF6F88A7),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.chevron_right,
              color: Color(0x886F88A7),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
