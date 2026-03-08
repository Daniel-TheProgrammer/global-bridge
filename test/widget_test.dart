import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:globalbridge/src/app/app.dart';
import 'package:globalbridge/src/core/di/injection_container.dart';

void main() {
  setUp(() async {
    await getIt.reset();
    await initDependencies();
  });

  testWidgets('renders all onboarding slides and navigates to login', (
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

    expect(find.textContaining('First top-up is on us.'), findsOneWidget);
    expect(find.textContaining('No hidden fees.'), findsOneWidget);
    expect(find.byKey(const Key('onboarding3_get_started')), findsOneWidget);

    await tester.ensureVisible(
      find.byKey(const Key('onboarding3_get_started')),
    );
    await tester.tap(find.byKey(const Key('onboarding3_get_started')));
    await tester.pumpAndSettle();

    expect(find.text('GLOBALBRIDGE'), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);

    await tester.ensureVisible(find.byKey(const Key('go_to_create_account')));
    await tester.tap(find.byKey(const Key('go_to_create_account')));
    await tester.pumpAndSettle();

    expect(find.text('Create Account'), findsOneWidget);
    expect(find.byKey(const Key('create_account_submit')), findsOneWidget);

    await tester.tap(find.byKey(const Key('read_terms')));
    await tester.pumpAndSettle();

    expect(find.text('Terms of Service'), findsOneWidget);
    await tester.tap(find.byKey(const Key('terms_accept')));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byKey(const Key('create_full_name')),
      'Marcus Goldman',
    );
    await tester.enterText(
      find.byKey(const Key('create_email')),
      'marcus@globalbridge.com',
    );
    await tester.enterText(
      find.byKey(const Key('create_password')),
      'SecurePass1',
    );
    await tester.enterText(
      find.byKey(const Key('create_confirm_password')),
      'SecurePass1',
    );
    await tester.tap(find.byKey(const Key('create_account_submit')));
    await tester.pumpAndSettle();

    expect(find.text('Email Verification'), findsOneWidget);
    expect(find.byKey(const Key('otp_verify')), findsOneWidget);
  });
}
