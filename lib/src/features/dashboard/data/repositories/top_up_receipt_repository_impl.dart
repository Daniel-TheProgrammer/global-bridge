import 'package:globalbridge/src/features/dashboard/data/datasources/remote_top_up_receipt_data_source.dart';
import 'package:globalbridge/src/features/dashboard/domain/entities/top_up_receipt.dart';
import 'package:globalbridge/src/features/dashboard/domain/repositories/top_up_receipt_repository.dart';

class TopUpReceiptRepositoryImpl implements TopUpReceiptRepository {
  const TopUpReceiptRepositoryImpl(this._remoteDataSource);

  final RemoteTopUpReceiptDataSource _remoteDataSource;

  @override
  Future<TopUpReceipt> fetchLatestReceipt() {
    return _remoteDataSource.fetchLatestReceipt();
  }
}
