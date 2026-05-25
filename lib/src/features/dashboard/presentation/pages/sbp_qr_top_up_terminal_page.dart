import 'package:flutter/material.dart';

class SbpQrTopUpTerminalPage extends StatelessWidget {
  const SbpQrTopUpTerminalPage({super.key});

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
                          key: const Key('sbp_terminal_back'),
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
                              'SBP QR Top-Up Terminal',
                              key: Key('sbp_terminal_title'),
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
                        Expanded(child: _ProgressSegment(active: true)),
                        SizedBox(width: 4),
                        Expanded(child: _ProgressSegment(active: true)),
                        SizedBox(width: 4),
                        Expanded(child: _ProgressSegment(active: true)),
                      ],
                    ),
                    const SizedBox(height: 26),
                    const Center(
                      child: Text(
                        'PAYMENT AMOUNT',
                        style: TextStyle(
                          color: Color(0xFF6F88A7),
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Center(
                      child: Text(
                        '1,425.00 RUB',
                        key: Key('sbp_terminal_amount'),
                        style: TextStyle(
                          color: Color(0xFFE7ECF3),
                          fontSize: 54 * 0.72,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Container(
                        key: const Key('sbp_terminal_qr_card'),
                        width: 286,
                        height: 286,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF4B6CFF),
                              Color(0xFF23D4E9),
                              Color(0xFF0AFFB2),
                            ],
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x5524CFE3),
                              blurRadius: 20,
                              spreadRadius: -6,
                            ),
                          ],
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFEFF1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ColoredBox(
                            color: const Color(0xFF2D7C77),
                            child: Center(
                              child: Container(
                                width: 102,
                                height: 102,
                                color: const Color(0xFFF2F3F5),
                                child: const Icon(
                                  Icons.qr_code_2,
                                  size: 82,
                                  color: Color(0xFF1F2937),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Center(
                      child: Text(
                        'Scan this QR with your banking app\n'
                        'to pay for Top-Up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFB9C7D7),
                          fontSize: 30 * 0.6,
                          height: 1.45,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      key: const Key('sbp_terminal_system_row'),
                      height: 54,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: const Color(0x1A203446),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: const Color(0x338FA3BA)),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            'System',
                            style: TextStyle(
                              color: Color(0xFF95A6BA),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'SBP (Quick Payment)',
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xFF24CFE3),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(
                            Icons.verified_outlined,
                            color: Color(0xFF24CFE3),
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 18,
                            color: Color(0xFF24CFE3),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Valid for 14:59',
                            key: Key('sbp_terminal_validity'),
                            style: TextStyle(
                              color: Color(0xFF24CFE3),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22),
                    InkWell(
                      key: const Key('sbp_terminal_save_qr'),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('QR saved to gallery.')),
                        );
                      },
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        height: 66,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFF24CFE3),
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x5524CFE3),
                              blurRadius: 18,
                              spreadRadius: -4,
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.download_outlined,
                              color: Color(0xFF03212B),
                            ),
                            SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                'Save QR to Gallery',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xFF03212B),
                                  fontSize: 32 * 0.62,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      key: const Key('sbp_terminal_payment_sent'),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Payment status sent for validation.',
                            ),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        height: 58,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0x1A203446),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: const Color(0x2B8FA3BA)),
                        ),
                        child: const Text(
                          'Payment Sent',
                          style: TextStyle(
                            color: Color(0xFFD6E0EC),
                            fontSize: 32 * 0.62,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Center(
                      child: Text(
                        'FUNDS ARE CREDITED INSTANTLY UPON CONFIRMATION',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0x667D8FA6),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.1,
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

class _ProgressSegment extends StatelessWidget {
  const _ProgressSegment({required this.active});

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
