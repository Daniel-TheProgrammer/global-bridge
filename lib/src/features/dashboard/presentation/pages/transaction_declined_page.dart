import 'package:flutter/material.dart';

class TransactionDeclinedPage extends StatelessWidget {
  const TransactionDeclinedPage({super.key});

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
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    border: Border.all(color: const Color(0x1F8FA3BA)),
                    color: const Color(0x141A283C),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            key: const Key('transaction_declined_close'),
                            onTap: () => Navigator.of(context).pop(),
                            borderRadius: BorderRadius.circular(18),
                            child: const SizedBox(
                              width: 36,
                              height: 36,
                              child: Icon(
                                Icons.close,
                                color: Color(0xFFE7ECF3),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Center(
                              child: Text(
                                'Transaction Error',
                                key: Key('transaction_declined_title'),
                                style: TextStyle(
                                  color: Color(0xFFE7ECF3),
                                  fontSize: 34 * 0.62,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 36),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Container(
                        width: 96,
                        height: 96,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0x3320161B),
                          border: Border.all(
                            color: const Color(0xAAFF3B44),
                            width: 2,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '!',
                            style: TextStyle(
                              color: Color(0xFFFF3B44),
                              fontSize: 42,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Container(
                        key: const Key('transaction_declined_reason_card'),
                        padding: const EdgeInsets.fromLTRB(18, 20, 18, 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(34),
                          color: const Color(0x1A1A2030),
                          border: Border.all(color: const Color(0x66C91D2A)),
                        ),
                        child: const Column(
                          children: [
                            Text(
                              'Top-Up Declined',
                              style: TextStyle(
                                color: Color(0xFFE7ECF3),
                                fontSize: 44 * 0.72,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'The payment could not be processed by your '
                              'bank. '
                              'Please ensure you have sufficient funds and '
                              'try again.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF9DB0C7),
                                fontSize: 30 * 0.58,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const _DetailRow(
                        label: 'Amount Requested',
                        value: '1,425.00 RUB',
                      ),
                      const Divider(color: Color(0x223193A8), height: 18),
                      const _DetailRow(
                        label: 'Card Number',
                        value: '**** 8829',
                      ),
                      const Divider(color: Color(0x223193A8), height: 18),
                      const _DetailRow(
                        label: 'Failure Reason',
                        value: 'Insufficient Funds / Declined',
                        valueColor: Color(0xFFFF3B44),
                      ),
                      const SizedBox(height: 18),
                      InkWell(
                        key: const Key('transaction_declined_retry'),
                        onTap: () => Navigator.of(context).pop(),
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          height: 64,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFF070F18),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x5524CFE3),
                                blurRadius: 14,
                                spreadRadius: -6,
                              ),
                            ],
                            border: Border.all(color: const Color(0x2B8FA3BA)),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.refresh, color: Color(0xFF24CFE3)),
                              SizedBox(width: 10),
                              Text(
                                'Retry Payment',
                                style: TextStyle(
                                  color: Color(0xFF24CFE3),
                                  fontSize: 32 * 0.62,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        key: const Key('transaction_declined_support'),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Support chat opened.'),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          height: 62,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0x141A283C),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0x2B8FA3BA)),
                          ),
                          child: const Text(
                            'Contact Support',
                            style: TextStyle(
                              color: Color(0xFFA9B9CD),
                              fontSize: 32 * 0.62,
                              fontWeight: FontWeight.w600,
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
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.label,
    required this.value,
    this.valueColor = const Color(0xFFE7ECF3),
  });

  final String label;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFF6F88A7),
              fontSize: 30 * 0.58,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: valueColor,
              fontSize: 32 * 0.62,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
