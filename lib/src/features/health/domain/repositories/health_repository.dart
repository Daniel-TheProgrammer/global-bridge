import 'package:dartz/dartz.dart';
import 'package:globalbridge/src/core/error/failures.dart';
import 'package:globalbridge/src/features/health/domain/entities/health_status.dart';

abstract interface class HealthRepository {
  Future<Either<Failure, HealthStatus>> getHealthStatus();
}
