import 'dart:async';

import 'package:flutter/material.dart';
import 'package:globalbridge/src/core/di/injection_container.dart';
import 'package:globalbridge/src/core/usecase/usecase.dart';
import 'package:globalbridge/src/features/dashboard/domain/entities/top_up_receipt.dart';
import 'package:globalbridge/src/features/dashboard/domain/usecases/get_top_up_receipt.dart';
import 'package:globalbridge/src/features/dashboard/presentation/pages/transaction_declined_page.dart';
import 'package:globalbridge/src/features/dashboard/presentation/pages/transaction_success_page.dart';

class TransactionProcessingPage extends StatefulWidget {
  const TransactionProcessingPage({
    this.getTopUpReceipt,
    super.key,
  });

  final GetTopUpReceipt? getTopUpReceipt;

  @override
  State<TransactionProcessingPage> createState() =>
      _TransactionProcessingPageState();
}

class _TransactionProcessingPageState extends State<TransactionProcessingPage> {
  @override
  void initState() {
    super.initState();
    unawaited(_runProcessingFlow());
  }

  Future<void> _runProcessingFlow() async {
    final getTopUpReceipt = widget.getTopUpReceipt ?? getIt<GetTopUpReceipt>();
    try {
      final receiptFuture = getTopUpReceipt(const NoParams());
      await Future.wait<void>([
        Future<void>(() async {
          await receiptFuture;
        }),
        Future<void>.delayed(
          const Duration(milliseconds: 1300),
        ),
      ]);
      final receipt = await receiptFuture;
      await _openSuccess(receipt);
    } on Exception {
      await _openDeclined();
    }
  }

  Future<void> _openSuccess(TopUpReceipt receipt) async {
    if (!mounted) {
      return;
    }
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => TransactionSuccessPage(receipt: receipt),
      ),
    );
  }

  Future<void> _openDeclined() async {
    if (!mounted) {
      return;
    }
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => const TransactionDeclinedPage(),
      ),
    );
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          key: const Key('processing_close'),
                          onTap: () => Navigator.of(context).pop(),
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0x1A203446),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: const Color(0x338FA3BA),
                              ),
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Color(0xFFA9B9CD),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'TOP-UP PROTOCOL',
                              style: TextStyle(
                                color: Color(0xFFCAD6E5),
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 3,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 40),
                      ],
                    ),
                    const Spacer(flex: 2),
                    Container(
                      width: 104,
                      height: 104,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0x3338D6E9),
                          width: 2,
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF07131D),
                        ),
                        child: const Icon(
                          Icons.hub_outlined,
                          color: Color(0xFF24CFE3),
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Processing Transaction',
                      key: Key('processing_title'),
                      style: TextStyle(
                        color: Color(0xFF24CFE3),
                        fontSize: 44 * 0.72,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '•',
                          style: TextStyle(
                            color: Color(0xFF24CFE3),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Secure Bridge Active',
                          style: TextStyle(
                            color: Color(0xFF9DB0C7),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Container(
                      key: const Key('processing_status_panel'),
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      decoration: BoxDecoration(
                        color: const Color(0x141A283C),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: const Color(0x2B8FA3BA)),
                      ),
                      child: const Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.sync_alt,
                                color: Color(0xFF24CFE3),
                                size: 19,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Synchronizing with Bank Gateway...',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xFFA9B9CD),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(999),
                            ),
                            child: LinearProgressIndicator(
                              minHeight: 3,
                              value: 0.68,
                              backgroundColor: Color(0x33495F79),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF24CFE3),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(
                                Icons.lock_outline,
                                color: Color(0xFF6F88A7),
                                size: 18,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Encrypting Transaction Data...',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xFF7E92AB),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 3),
                    const Text(
                      'SECURITY PROTOCOL V4.2',
                      style: TextStyle(
                        color: Color(0x667D8FA6),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shield_outlined,
                          color: Color(0x667D8FA6),
                          size: 16,
                        ),
                        SizedBox(width: 12),
                        Icon(
                          Icons.security_outlined,
                          color: Color(0x667D8FA6),
                          size: 16,
                        ),
                        SizedBox(width: 12),
                        Icon(
                          Icons.lock_outline,
                          color: Color(0x667D8FA6),
                          size: 16,
                        ),
                      ],
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
