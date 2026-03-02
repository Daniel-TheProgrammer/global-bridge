import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:globalbridge/src/core/error/failures.dart';
import 'package:globalbridge/src/core/usecase/usecase.dart';
import 'package:globalbridge/src/features/health/domain/entities/health_status.dart';
import 'package:globalbridge/src/features/health/domain/usecases/get_health_status.dart';
import 'package:globalbridge/src/features/health/presentation/bloc/health_bloc.dart';
import 'package:globalbridge/src/features/health/presentation/bloc/health_event.dart';
import 'package:globalbridge/src/features/health/presentation/bloc/health_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockGetHealthStatus extends Mock implements GetHealthStatus {}

void main() {
  late _MockGetHealthStatus getHealthStatus;
  late HealthStatus healthStatus;

  setUp(() {
    getHealthStatus = _MockGetHealthStatus();
    healthStatus = HealthStatus(
      message: 'GlobalBridge is healthy',
      timestamp: DateTime.utc(2026),
      isHealthy: true,
    );
  });

  blocTest<HealthBloc, HealthState>(
    'emits [loading, success] on successful response',
    build: () {
      when(
        () => getHealthStatus(const NoParams()),
      ).thenAnswer((_) async => Right(healthStatus));
      return HealthBloc(getHealthStatus);
    },
    act: (bloc) => bloc.add(const HealthRequested()),
    expect: () => [
      const HealthLoadInProgress(),
      HealthLoadSuccess(healthStatus),
    ],
    verify: (_) {
      verify(() => getHealthStatus(const NoParams())).called(1);
    },
  );

  blocTest<HealthBloc, HealthState>(
    'emits [loading, failure] on failed response',
    build: () {
      when(() => getHealthStatus(const NoParams())).thenAnswer(
        (_) async => const Left(GeneralFailure('failed')),
      );
      return HealthBloc(getHealthStatus);
    },
    act: (bloc) => bloc.add(const HealthRequested()),
    expect: () => [
      const HealthLoadInProgress(),
      const HealthLoadFailure('failed'),
    ],
  );
}
