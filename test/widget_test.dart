import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:globalbridge/src/app/app.dart';
import 'package:globalbridge/src/core/di/injection_container.dart';

void main() {
  setUp(() async {
    await getIt.reset();
    await initDependencies();
  });

  testWidgets('renders both onboarding slides and navigates to login', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1170, 2652);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const GlobalBridgeApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    expect(find.text('GlobalBridge'), findsOneWidget);
    expect(find.textContaining('Global Payments'), findsOneWidget);
    expect(find.textContaining('Simplified'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);

    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    expect(find.textContaining('One Card.'), findsOneWidget);
    expect(find.textContaining('365 Days of Freedom.'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);

    await tester.ensureVisible(find.text('Continue'));
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    expect(find.text('GLOBALBRIDGE'), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);
  });
}
