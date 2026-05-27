import 'dart:async';

import 'package:flutter/material.dart';
import 'package:globalbridge/src/features/dashboard/domain/entities/top_up_receipt.dart';
import 'package:globalbridge/src/features/dashboard/presentation/pages/security_vault_page.dart';

class TransactionSuccessPage extends StatelessWidget {
  const TransactionSuccessPage({
    required this.receipt,
    super.key,
  });

  final TopUpReceipt receipt;

  Future<void> _goToVault(BuildContext context) async {
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (_) => const SecurityVaultPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final requestedAt =
        '${_monthAbbreviation(receipt.serverTime.month)} '
        '${receipt.serverTime.day}, ${receipt.serverTime.year}';
    final totalAddedRubText =
        '+${receipt.totalAddedRub.toStringAsFixed(2)} RUB';
    final totalUsdText = '\$${receipt.amountUsd.toStringAsFixed(2)}';
    final serviceFeeText = '\$${receipt.serviceFeeUsd.toStringAsFixed(2)}';

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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          key: const Key('transaction_success_close'),
                          onTap: () => Navigator.of(context).pop(),
                          borderRadius: BorderRadius.circular(20),
                          child: const SizedBox(
                            width: 40,
                            height: 40,
                            child: Icon(Icons.close, color: Color(0xFFE7ECF3)),
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Confirmation',
                              style: TextStyle(
                                color: Color(0xFFE7ECF3),
                                fontSize: 34 * 0.62,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 40),
                      ],
                    ),
                    const SizedBox(height: 26),
                    Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0x2218BC68),
                        border: Border.all(
                          color: const Color(0xAA16D46C),
                          width: 2,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x4416D46C),
                            blurRadius: 22,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Color(0xFF16D46C),
                        size: 48,
                      ),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Top-Up Successful',
                      key: Key('transaction_success_title'),
                      style: TextStyle(
                        color: Color(0xFFE7ECF3),
                        fontSize: 50 * 0.72,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      key: const Key('transaction_success_amount_badge'),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0x2216D46C),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        totalAddedRubText,
                        style: const TextStyle(
                          color: Color(0xFF16D46C),
                          fontSize: 44 * 0.62,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    Container(
                      key: const Key('transaction_success_summary_card'),
                      padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
                      decoration: BoxDecoration(
                        color: const Color(0x141A283C),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0x2B8FA3BA)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Funds have been added to your\n'
                            '${receipt.destination}.',
                            style: const TextStyle(
                              color: Color(0xFFA9B9CD),
                              fontSize: 30 * 0.58,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 14),
                          const Divider(color: Color(0x223193A8), height: 8),
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  'New balance',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xFF6F88A7),
                                    fontSize: 30 * 0.58,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  '$totalUsdText USD',
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Color(0xFFE7ECF3),
                                    fontSize: 34 * 0.62,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          const Divider(color: Color(0x223193A8), height: 8),
                          const SizedBox(height: 14),
                          _SummaryRow(
                            label: 'Transaction ID',
                            value: receipt.transactionId,
                          ),
                          const SizedBox(height: 10),
                          _SummaryRow(label: 'Method', value: receipt.method),
                          const SizedBox(height: 10),
                          _SummaryRow(
                            label: 'Service Fee',
                            value: serviceFeeText,
                          ),
                          const SizedBox(height: 10),
                          _SummaryRow(
                            label: 'Exchange Rate',
                            value: receipt.exchangeRate,
                          ),
                          const SizedBox(height: 10),
                          _SummaryRow(
                            label: 'Current Status',
                            value: receipt.status,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Transaction completed on $requestedAt',
                      key: const Key('transaction_success_server_time'),
                      style: const TextStyle(
                        color: Color(0xFF9DB0C7),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 24),
                    InkWell(
                      key: const Key('transaction_success_back_to_vault'),
                      onTap: () {
                        unawaited(_goToVault(context));
                      },
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        height: 66,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFF070F18),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: const Color(0x2B8FA3BA)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x5524CFE3),
                              blurRadius: 14,
                              spreadRadius: -6,
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.account_balance_wallet_outlined,
                              color: Color(0xFF24CFE3),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Back to Vault',
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
                    const SizedBox(height: 16),
                    const Text(
                      'SECURELY PROCESSED BY GLOBALBRIDGE',
                      style: TextStyle(
                        color: Color(0x667D8FA6),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.6,
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

  String _monthAbbreviation(int month) {
    const months = <String>[
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFF6F88A7),
              fontSize: 28 * 0.58,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFFE7ECF3),
              fontSize: 30 * 0.58,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
