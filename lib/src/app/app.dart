import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globalbridge/src/core/di/injection_container.dart';
import 'package:globalbridge/src/features/health/presentation/bloc/health_bloc.dart';
import 'package:globalbridge/src/features/health/presentation/bloc/health_event.dart';
import 'package:globalbridge/src/features/health/presentation/pages/home_page.dart';

class GlobalBridgeApp extends StatelessWidget {
  const GlobalBridgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HealthBloc>(
          create: (_) => getIt<HealthBloc>()..add(const HealthRequested()),
        ),
      ],
      child: MaterialApp(
        title: 'GlobalBridge',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0057FF)),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
