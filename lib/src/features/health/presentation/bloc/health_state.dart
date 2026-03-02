import 'package:equatable/equatable.dart';
import 'package:globalbridge/src/features/health/domain/entities/health_status.dart';

sealed class HealthState extends Equatable {
  const HealthState();

  @override
  List<Object?> get props => [];
}

class HealthInitial extends HealthState {
  const HealthInitial();
}

class HealthLoadInProgress extends HealthState {
  const HealthLoadInProgress();
}

class HealthLoadSuccess extends HealthState {
  const HealthLoadSuccess(this.status);

  final HealthStatus status;

  @override
  List<Object?> get props => [status];
}

class HealthLoadFailure extends HealthState {
  const HealthLoadFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
