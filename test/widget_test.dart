import 'package:flutter_test/flutter_test.dart';
import 'package:globalbridge/src/app/app.dart';
import 'package:globalbridge/src/core/di/injection_container.dart';

void main() {
  setUp(() async {
    await getIt.reset();
    await initDependencies();
  });

  testWidgets('renders home screen and health status', (tester) async {
    await tester.pumpWidget(const GlobalBridgeApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    expect(find.text('GlobalBridge'), findsOneWidget);
    expect(find.textContaining('GlobalBridge is healthy'), findsOneWidget);
  });
}
