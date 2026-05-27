import 'package:globalbridge/src/features/dashboard/domain/entities/top_up_receipt.dart';

abstract interface class TopUpReceiptRepository {
  Future<TopUpReceipt> fetchLatestReceipt();
}
