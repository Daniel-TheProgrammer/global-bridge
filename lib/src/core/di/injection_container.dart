import 'package:get_it/get_it.dart';
import 'package:globalbridge/src/features/dashboard/data/datasources/remote_top_up_receipt_data_source.dart';
import 'package:globalbridge/src/features/dashboard/data/repositories/top_up_receipt_repository_impl.dart';
import 'package:globalbridge/src/features/dashboard/domain/repositories/top_up_receipt_repository.dart';
import 'package:globalbridge/src/features/dashboard/domain/usecases/get_top_up_receipt.dart';
import 'package:globalbridge/src/features/health/data/datasources/local_health_data_source.dart';
import 'package:globalbridge/src/features/health/data/repositories/health_repository_impl.dart';
import 'package:globalbridge/src/features/health/domain/repositories/health_repository.dart';
import 'package:globalbridge/src/features/health/domain/usecases/get_health_status.dart';
import 'package:globalbridge/src/features/health/presentation/bloc/health_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> initDependencies() async {
  getIt
    ..registerLazySingleton<RemoteTopUpReceiptDataSource>(
      RemoteTopUpReceiptDataSourceImpl.new,
    )
    ..registerLazySingleton<TopUpReceiptRepository>(
      () => TopUpReceiptRepositoryImpl(getIt<RemoteTopUpReceiptDataSource>()),
    )
    ..registerLazySingleton<GetTopUpReceipt>(
      () => GetTopUpReceipt(getIt<TopUpReceiptRepository>()),
    )
    ..registerLazySingleton<LocalHealthDataSource>(
      LocalHealthDataSourceImpl.new,
    )
    ..registerLazySingleton<HealthRepository>(
      () => HealthRepositoryImpl(getIt<LocalHealthDataSource>()),
    )
    ..registerLazySingleton<GetHealthStatus>(
      () => GetHealthStatus(getIt<HealthRepository>()),
    )
    ..registerFactory<HealthBloc>(
      () => HealthBloc(getIt<GetHealthStatus>()),
    );
}
