import 'dart:async';

import 'package:globalbridge/src/features/dashboard/domain/entities/top_up_receipt.dart';

abstract interface class RemoteTopUpReceiptDataSource {
  Future<TopUpReceipt> fetchLatestReceipt();
}

class RemoteTopUpReceiptDataSourceImpl implements RemoteTopUpReceiptDataSource {
  const RemoteTopUpReceiptDataSourceImpl();

  @override
  Future<TopUpReceipt> fetchLatestReceipt() async {
    // Simulated secure backend roundtrip.
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return TopUpReceipt(
      amountUsd: 15,
      totalAddedRub: 1425,
      transactionId: '#GB-99281-TRX',
      method: 'Bank Card (**** 4421)',
      destination: 'GlobalBridge (**** 8829)',
      serviceFeeUsd: 0,
      exchangeRate: '1 USD = 95.00 RUB',
      status: 'Active',
      serverTime: DateTime.now().toUtc(),
    );
  }
}
