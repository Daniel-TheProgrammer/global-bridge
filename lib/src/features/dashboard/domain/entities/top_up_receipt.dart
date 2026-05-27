class TopUpReceipt {
  const TopUpReceipt({
    required this.amountUsd,
    required this.totalAddedRub,
    required this.transactionId,
    required this.method,
    required this.destination,
    required this.serviceFeeUsd,
    required this.exchangeRate,
    required this.status,
    required this.serverTime,
  });

  final double amountUsd;
  final double totalAddedRub;
  final String transactionId;
  final String method;
  final String destination;
  final double serviceFeeUsd;
  final String exchangeRate;
  final String status;
  final DateTime serverTime;
}
