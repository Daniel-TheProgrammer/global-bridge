import 'package:globalbridge/src/core/usecase/usecase.dart';
import 'package:globalbridge/src/features/dashboard/domain/entities/top_up_receipt.dart';
import 'package:globalbridge/src/features/dashboard/domain/repositories/top_up_receipt_repository.dart';

class GetTopUpReceipt implements UseCase<TopUpReceipt, NoParams> {
  const GetTopUpReceipt(this._repository);

  final TopUpReceiptRepository _repository;

  @override
  Future<TopUpReceipt> call(NoParams params) {
    return _repository.fetchLatestReceipt();
  }
}
