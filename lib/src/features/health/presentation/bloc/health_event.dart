import 'package:equatable/equatable.dart';

sealed class HealthEvent extends Equatable {
  const HealthEvent();

  @override
  List<Object?> get props => [];
}

class HealthRequested extends HealthEvent {
  const HealthRequested();
}
