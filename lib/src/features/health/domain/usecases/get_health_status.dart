import 'package:dartz/dartz.dart';
import 'package:globalbridge/src/core/error/failures.dart';
import 'package:globalbridge/src/core/usecase/usecase.dart';
import 'package:globalbridge/src/features/health/domain/entities/health_status.dart';
import 'package:globalbridge/src/features/health/domain/repositories/health_repository.dart';

class GetHealthStatus
    implements UseCase<Either<Failure, HealthStatus>, NoParams> {
  const GetHealthStatus(this._repository);

  final HealthRepository _repository;

  @override
  Future<Either<Failure, HealthStatus>> call(NoParams params) {
    return _repository.getHealthStatus();
  }
}
