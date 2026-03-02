import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globalbridge/src/features/health/presentation/bloc/health_bloc.dart';
import 'package:globalbridge/src/features/health/presentation/bloc/health_event.dart';
import 'package:globalbridge/src/features/health/presentation/bloc/health_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GlobalBridge')),
      body: Center(
        child: BlocBuilder<HealthBloc, HealthState>(
          builder: (context, state) {
            return switch (state) {
              HealthInitial() => const Text('Initializing...'),
              HealthLoadInProgress() => const CircularProgressIndicator(),
              HealthLoadSuccess(status: final status) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    status.isHealthy ? Icons.check_circle : Icons.error_outline,
                    color: status.isHealthy ? Colors.green : Colors.red,
                    size: 48,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    status.message,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Last sync: ${status.timestamp.toIso8601String()}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              HealthLoadFailure(message: final message) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 12),
                  Text(message, textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () {
                      context.read<HealthBloc>().add(const HealthRequested());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            };
          },
        ),
      ),
    );
  }
}
