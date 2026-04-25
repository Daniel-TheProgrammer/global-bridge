import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UsdtTopUpTerminalPage extends StatefulWidget {
  const UsdtTopUpTerminalPage({super.key});

  @override
  State<UsdtTopUpTerminalPage> createState() => _UsdtTopUpTerminalPageState();
}

class _UsdtTopUpTerminalPageState extends State<UsdtTopUpTerminalPage> {
  static const String _maskedAddress = 'TL17...x8m2';
  static const String _unmaskedAddress = 'TL17f8Qx1vK2m3N4p5R6s7T8u9V0x8m2';
  bool _isAddressVisible = false;

  String get _displayAddress =>
      _isAddressVisible ? _unmaskedAddress : _maskedAddress;

  void _copyAddress(BuildContext context) {
    Clipboard.setData(const ClipboardData(text: _unmaskedAddress));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Wallet address copied.')),
    );
  }

  void _toggleAddressVisibility() {
    setState(() => _isAddressVisible = !_isAddressVisible);
  }

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
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          key: const Key('usdt_terminal_back'),
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
                              'USDT Top-Up Terminal',
                              key: Key('usdt_terminal_title'),
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
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Expanded(child: _StepSegment(active: true)),
                        SizedBox(width: 4),
                        Expanded(child: _StepSegment(active: true)),
                        SizedBox(width: 4),
                        Expanded(child: _StepSegment(active: true)),
                      ],
                    ),
                    const SizedBox(height: 22),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0x141A283C),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0x2B8FA3BA)),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3324CFE3),
                            blurRadius: 20,
                            spreadRadius: -6,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Container(
                          key: const Key('usdt_terminal_qr_card'),
                          width: 220,
                          height: 220,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF4F6F8),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            color: const Color(0xFFE8C5BC),
                            child: Center(
                              child: Container(
                                width: 88,
                                height: 88,
                                color: const Color(0xFFEEEAE9),
                                child: const Icon(
                                  Icons.qr_code_2,
                                  size: 74,
                                  color: Color(0xFF1F2937),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        'TRC20 WALLET ADDRESS',
                        style: TextStyle(
                          color: Color(0xFF6F88A7),
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      key: const Key('usdt_terminal_wallet_container'),
                      height: 56,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: const Color(0x1A203446),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: const Color(0x338FA3BA)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              _displayAddress,
                              key: const Key('usdt_terminal_wallet_address'),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xFF24CFE3),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.1,
                              ),
                            ),
                          ),
                          InkWell(
                            key: const Key(
                              'usdt_terminal_toggle_address_visibility',
                            ),
                            onTap: _toggleAddressVisibility,
                            borderRadius: BorderRadius.circular(999),
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: const Color(0x1224CFE3),
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Icon(
                                _isAddressVisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 17,
                                color: const Color(0xFF24CFE3),
                              ),
                            ),
                          ),
                          InkWell(
                            key: const Key('usdt_terminal_copy_address'),
                            onTap: () => _copyAddress(context),
                            borderRadius: BorderRadius.circular(999),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0x1A24CFE3),
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.content_copy_outlined,
                                    size: 16,
                                    color: Color(0xFF24CFE3),
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    'COPY ADDRESS',
                                    style: TextStyle(
                                      color: Color(0xFF24CFE3),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      decoration: BoxDecoration(
                        color: const Color(0x1A203446),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: const Color(0x338FA3BA)),
                      ),
                      child: const Column(
                        children: [
                          _TerminalStatusRow(
                            icon: Icons.account_balance_wallet_outlined,
                            label: 'Pay Amount',
                            value: '15.00 USDT',
                          ),
                          SizedBox(height: 16),
                          _TerminalStatusRow(
                            icon: Icons.hub_outlined,
                            label: 'Network',
                            value: 'TRC20',
                            valueColor: Color(0xFF24CFE3),
                          ),
                          SizedBox(height: 16),
                          _TerminalStatusRow(
                            icon: Icons.verified_outlined,
                            label: 'Current Status',
                            value: 'Active',
                            trailingIcon: Icons.check_circle_outline,
                            trailingIconColor: Color(0xFF00E676),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      key: const Key('usdt_terminal_attention'),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0x18140F0B),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0x447A5A2D)),
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.warning_amber_rounded,
                            color: Color(0xFFDFA743),
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Attention: Only send USDT via TRC20 network.\n'
                              'Funds will be added after one confirmation.',
                              style: TextStyle(
                                color: Color(0xFFC8B084),
                                fontSize: 13,
                                height: 1.45,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      key: const Key('usdt_terminal_confirm'),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'USDT top-up confirmation submitted.',
                            ),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        height: 64,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFF070F18),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0x2B8FA3BA)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                'Confirm Top-Up of 1,425.00 RUB',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xFFE7ECF3),
                                  fontSize: 33 * 0.62,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward, color: Color(0xFF24CFE3)),
                          ],
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

class _StepSegment extends StatelessWidget {
  const _StepSegment({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      decoration: BoxDecoration(
        color: active ? const Color(0xFF24CFE3) : const Color(0x334B6990),
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }
}

class _TerminalStatusRow extends StatelessWidget {
  const _TerminalStatusRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor = const Color(0xFFE7ECF3),
    this.trailingIcon,
    this.trailingIconColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color valueColor;
  final IconData? trailingIcon;
  final Color? trailingIconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF24CFE3), size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFFB9C7D7),
              fontSize: 32 * 0.58,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Flexible(
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: valueColor,
              fontSize: 32 * 0.62,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        if (trailingIcon != null)
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Icon(trailingIcon, color: trailingIconColor, size: 18),
          ),
      ],
    );
  }
}
