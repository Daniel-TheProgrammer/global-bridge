import 'package:equatable/equatable.dart';

class HealthStatus extends Equatable {
  const HealthStatus({
    required this.message,
    required this.timestamp,
    required this.isHealthy,
  });

  final String message;
  final DateTime timestamp;
  final bool isHealthy;

  @override
  List<Object> get props => [message, timestamp, isHealthy];
}
