import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globalbridge/src/core/usecase/usecase.dart';
import 'package:globalbridge/src/features/health/domain/usecases/get_health_status.dart';
import 'package:globalbridge/src/features/health/presentation/bloc/health_event.dart';
import 'package:globalbridge/src/features/health/presentation/bloc/health_state.dart';

class HealthBloc extends Bloc<HealthEvent, HealthState> {
  HealthBloc(this._getHealthStatus) : super(const HealthInitial()) {
    on<HealthRequested>(_onHealthRequested);
  }

  final GetHealthStatus _getHealthStatus;

  Future<void> _onHealthRequested(
    HealthRequested event,
    Emitter<HealthState> emit,
  ) async {
    emit(const HealthLoadInProgress());
    final result = await _getHealthStatus(const NoParams());
    result.fold(
      (failure) => emit(HealthLoadFailure(failure.message)),
      (status) => emit(HealthLoadSuccess(status)),
    );
  }
}
