import 'package:globalbridge/src/features/health/domain/entities/health_status.dart';

abstract interface class LocalHealthDataSource {
  Future<HealthStatus> getHealthStatus();
}

class LocalHealthDataSourceImpl implements LocalHealthDataSource {
  @override
  Future<HealthStatus> getHealthStatus() async {
    return HealthStatus(
      message: 'GlobalBridge is healthy',
      timestamp: DateTime.now().toUtc(),
      isHealthy: true,
    );
  }
}
