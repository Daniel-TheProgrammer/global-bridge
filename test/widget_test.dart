import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:globalbridge/src/app/app.dart';
import 'package:globalbridge/src/core/di/injection_container.dart';

void main() {
  setUp(() async {
    await getIt.reset();
    await initDependencies();
  });

  testWidgets('renders login screen content', (tester) async {
    tester.view.physicalSize = const Size(1170, 2652);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const GlobalBridgeApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    expect(find.text('GLOBALBRIDGE'), findsOneWidget);
    expect(find.text('A DIGITAL SERVICE CONCIERGE'), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);
    expect(find.text('Login with Telegram'), findsOneWidget);
  });
}
