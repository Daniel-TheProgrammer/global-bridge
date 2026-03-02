import 'package:dartz/dartz.dart';
import 'package:globalbridge/src/core/error/failures.dart';
import 'package:globalbridge/src/features/health/data/datasources/local_health_data_source.dart';
import 'package:globalbridge/src/features/health/domain/entities/health_status.dart';
import 'package:globalbridge/src/features/health/domain/repositories/health_repository.dart';

class HealthRepositoryImpl implements HealthRepository {
  const HealthRepositoryImpl(this._localDataSource);

  final LocalHealthDataSource _localDataSource;

  @override
  Future<Either<Failure, HealthStatus>> getHealthStatus() async {
    try {
      final status = await _localDataSource.getHealthStatus();
      return Right(status);
    } on Object {
      return const Left(
        GeneralFailure('Unable to retrieve application health status'),
      );
    }
  }
}
