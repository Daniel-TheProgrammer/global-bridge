import 'package:flutter/widgets.dart';
import 'package:globalbridge/src/app/app.dart';
import 'package:globalbridge/src/core/di/injection_container.dart';

Future<void> main() async {
  await initDependencies();
  runApp(const GlobalBridgeApp());
}
