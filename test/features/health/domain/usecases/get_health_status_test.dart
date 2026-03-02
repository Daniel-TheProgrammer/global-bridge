import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:globalbridge/src/core/error/failures.dart';
import 'package:globalbridge/src/core/usecase/usecase.dart';
import 'package:globalbridge/src/features/health/domain/entities/health_status.dart';
import 'package:globalbridge/src/features/health/domain/repositories/health_repository.dart';
import 'package:globalbridge/src/features/health/domain/usecases/get_health_status.dart';
import 'package:mocktail/mocktail.dart';

class _MockHealthRepository extends Mock implements HealthRepository {}

void main() {
  late _MockHealthRepository repository;
  late GetHealthStatus useCase;

  setUp(() {
    repository = _MockHealthRepository();
    useCase = GetHealthStatus(repository);
  });

  test('returns health status when repository call succeeds', () async {
    final expectedStatus = HealthStatus(
      message: 'ok',
      timestamp: DateTime.utc(2026),
      isHealthy: true,
    );

    when(
      repository.getHealthStatus,
    ).thenAnswer((_) async => Right(expectedStatus));

    final result = await useCase(const NoParams());

    expect(result, Right<Failure, HealthStatus>(expectedStatus));
    verify(repository.getHealthStatus).called(1);
  });

  test('returns failure when repository call fails', () async {
    const failure = GeneralFailure('error');
    when(
      repository.getHealthStatus,
    ).thenAnswer((_) async => const Left(failure));

    final result = await useCase(const NoParams());

    expect(result, const Left<Failure, HealthStatus>(failure));
    verify(repository.getHealthStatus).called(1);
  });
}
