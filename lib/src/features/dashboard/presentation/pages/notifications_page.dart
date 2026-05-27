import 'package:flutter/material.dart';

enum NotificationCategory { payment, card, security, wallet }

class NotificationEntry {
  const NotificationEntry({
    required this.category,
    required this.title,
    required this.message,
    required this.timeAgo,
    required this.isRecent,
  });

  final NotificationCategory category;
  final String title;
  final String message;
  final String timeAgo;
  final bool isRecent;
}

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<NotificationEntry> _items = <NotificationEntry>[
    const NotificationEntry(
      category: NotificationCategory.payment,
      title: 'Payment Successful',
      message: r'Your payment of $24.99 to DigitalStream was processed.',
      timeAgo: '2m ago',
      isRecent: true,
    ),
    const NotificationEntry(
      category: NotificationCategory.card,
      title: 'Card Expiring Soon',
      message: 'Your virtual card ending in 4022 expires in 7 days. Renew now.',
      timeAgo: '45m ago',
      isRecent: true,
    ),
    const NotificationEntry(
      category: NotificationCategory.security,
      title: 'Security Alert: New Login',
      message: 'A new login was detected from Chrome on MacOS. Was this you?',
      timeAgo: '2h ago',
      isRecent: true,
    ),
    const NotificationEntry(
      category: NotificationCategory.wallet,
      title: 'Wallet Topped Up',
      message: r'Successfully added $500.00 to your Vault via Bank Transfer.',
      timeAgo: '1d ago',
      isRecent: false,
    ),
  ];

  void _clearAll() => setState(_items.clear);

  @override
  Widget build(BuildContext context) {
    final recent = _items.where((item) => item.isRecent).toList();
    final previous = _items.where((item) => !item.isRecent).toList();

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
              child: Column(
                children: [
                  _Header(onClearAll: _clearAll),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
                      children: [
                        if (recent.isNotEmpty) ...[
                          const _SectionLabel('RECENT'),
                          const SizedBox(height: 10),
                          ...recent.map(
                            (entry) => _NotificationTile(entry: entry),
                          ),
                        ],
                        if (previous.isNotEmpty) ...[
                          const SizedBox(height: 10),
                          const _SectionLabel('YESTERDAY'),
                          const SizedBox(height: 10),
                          ...previous.map(
                            (entry) => _NotificationTile(entry: entry),
                          ),
                        ],
                        if (_items.isEmpty)
                          const Padding(
                            padding: EdgeInsets.only(top: 56),
                            child: Center(
                              child: Text(
                                'No notifications right now.',
                                key: Key('notifications_empty_state'),
                                style: TextStyle(
                                  color: Color(0xFF95A6BA),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    key: const Key('notifications_bottom_nav'),
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
                        _NavItem(icon: Icons.shield_outlined, label: 'VAULT'),
                        _NavItem(
                          icon: Icons.credit_card_outlined,
                          label: 'CARDS',
                        ),
                        _NavItem(icon: Icons.history, label: 'HISTORY'),
                        _NavItem(icon: Icons.person_outline, label: 'PROFILE'),
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
}

class _Header extends StatelessWidget {
  const _Header({required this.onClearAll});

  final VoidCallback onClearAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 6, 8, 8),
      child: Row(
        children: [
          InkWell(
            key: const Key('notifications_back'),
            onTap: () => Navigator.of(context).pop(),
            borderRadius: BorderRadius.circular(20),
            child: const SizedBox(
              width: 40,
              height: 40,
              child: Icon(Icons.arrow_back_ios_new, color: Color(0xFFE7ECF3)),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Notifications',
                key: Key('notifications_title'),
                style: TextStyle(
                  color: Color(0xFFE7ECF3),
                  fontSize: 34 * 0.62,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          TextButton(
            key: const Key('notifications_clear_all'),
            onPressed: onClearAll,
            child: const Text(
              'CLEAR ALL',
              style: TextStyle(
                color: Color(0xFF24CFE3),
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF24CFE3),
        fontSize: 13,
        fontWeight: FontWeight.w700,
        letterSpacing: 2.4,
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({required this.entry});

  final NotificationEntry entry;

  @override
  Widget build(BuildContext context) {
    final style = _notificationStyle(entry.category);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: const Color(0x141A283C),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0x2B8FA3BA)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: style.background,
              borderRadius: BorderRadius.circular(26),
            ),
            child: Icon(style.icon, color: style.foreground, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        entry.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFFE7ECF3),
                          fontSize: 30 * 0.62,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      entry.timeAgo,
                      style: const TextStyle(
                        color: Color(0xFF95A6BA),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(Icons.circle, color: Color(0xFF24CFE3), size: 7),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  entry.message,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF95A6BA),
                    fontSize: 30 * 0.55,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _NotificationStyle _notificationStyle(NotificationCategory category) {
    switch (category) {
      case NotificationCategory.payment:
        return const _NotificationStyle(
          icon: Icons.check_circle_outline,
          foreground: Color(0xFF24CFE3),
          background: Color(0x2224CFE3),
        );
      case NotificationCategory.card:
        return const _NotificationStyle(
          icon: Icons.error_outline,
          foreground: Color(0xFFE4B728),
          background: Color(0x22E4B728),
        );
      case NotificationCategory.security:
        return const _NotificationStyle(
          icon: Icons.security_outlined,
          foreground: Color(0xFFD35B63),
          background: Color(0x22D35B63),
        );
      case NotificationCategory.wallet:
        return const _NotificationStyle(
          icon: Icons.account_balance_wallet_outlined,
          foreground: Color(0xFF24CFE3),
          background: Color(0x2224CFE3),
        );
    }
  }
}

class _NotificationStyle {
  const _NotificationStyle({
    required this.icon,
    required this.foreground,
    required this.background,
  });

  final IconData icon;
  final Color foreground;
  final Color background;
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: const Color(0xFF24CFE3), size: 22),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF24CFE3),
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
