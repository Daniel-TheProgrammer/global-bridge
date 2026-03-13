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
    expect(find.byKey(const Key('go_to_reset_password')), findsOneWidget);

    await tester.ensureVisible(find.byKey(const Key('go_to_create_account')));
    await tester.tap(find.byKey(const Key('go_to_create_account')));
    await tester.pumpAndSettle();

    expect(find.text('Join GlobalBridge'), findsOneWidget);
    expect(find.byKey(const Key('create_account_submit')), findsOneWidget);

    await tester.tap(find.byKey(const Key('read_terms')));
    await tester.pumpAndSettle();

    expect(find.text('Terms of Service'), findsOneWidget);
    await tester.tap(find.byKey(const Key('view_privacy_policy')));
    await tester.pumpAndSettle();

    expect(find.text('Privacy Policy'), findsOneWidget);
    await tester.tap(find.byKey(const Key('privacy_back')));
    await tester.pumpAndSettle();

    expect(find.text('Terms of Service'), findsOneWidget);
    await tester.tap(find.byKey(const Key('terms_accept')));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byKey(const Key('create_email')),
      'marcus@globalbridge.com',
    );
    await tester.enterText(
      find.byKey(const Key('create_password')),
      'SecurePass1',
    );
    await tester.enterText(
      find.byKey(const Key('create_referral_code')),
      'INVITE2026',
    );
    await tester.tap(find.byKey(const Key('create_account_submit')));
    await tester.pumpAndSettle();

    expect(find.text('Verify Your Identity'), findsOneWidget);
    await tester.tap(find.byKey(const Key('kyc_id_type_school')));
    await tester.pumpAndSettle();

    expect(find.text('Identity Verification'), findsOneWidget);
    expect(find.byKey(const Key('school_id_upload_gallery')), findsOneWidget);
    await tester.tap(find.byKey(const Key('school_id_upload_gallery')));
    await tester.pumpAndSettle();

    expect(find.text('KYC PHASE 2'), findsOneWidget);
    expect(find.byKey(const Key('face_verification_complete')), findsOneWidget);
    await tester.tap(find.byKey(const Key('face_verification_complete')));
    await tester.pumpAndSettle();

    expect(find.text('Card Activation'), findsOneWidget);
    expect(find.byKey(const Key('card_activation_ready')), findsOneWidget);
  });

  testWidgets('navigates to reset password from login', (tester) async {
    tester.view.physicalSize = const Size(1170, 2652);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const GlobalBridgeApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Continue'));
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(
      find.byKey(const Key('onboarding3_get_started')),
    );
    await tester.tap(find.byKey(const Key('onboarding3_get_started')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('go_to_reset_password')));
    await tester.pumpAndSettle();

    expect(find.text('Reset Password'), findsOneWidget);
    expect(find.byKey(const Key('reset_password_submit')), findsOneWidget);

    await tester.enterText(
      find.byKey(const Key('reset_email')),
      'marcus@globalbridge.com',
    );
    await tester.enterText(
      find.byKey(const Key('reset_new_password')),
      'SecurePass1',
    );
    await tester.enterText(
      find.byKey(const Key('reset_confirm_password')),
      'SecurePass1',
    );

    await tester.tap(find.byKey(const Key('reset_password_submit')));
    await tester.pumpAndSettle();

    expect(find.text('LOGIN'), findsOneWidget);
  });

  testWidgets('opens school id screen from kyc verification', (tester) async {
    tester.view.physicalSize = const Size(1170, 2652);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const GlobalBridgeApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Continue'));
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(
      find.byKey(const Key('onboarding3_get_started')),
    );
    await tester.tap(find.byKey(const Key('onboarding3_get_started')));
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.byKey(const Key('go_to_create_account')));
    await tester.tap(find.byKey(const Key('go_to_create_account')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('read_terms')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('terms_accept')));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byKey(const Key('create_email')),
      'marcus@globalbridge.com',
    );
    await tester.enterText(
      find.byKey(const Key('create_password')),
      'SecurePass1',
    );
    await tester.enterText(
      find.byKey(const Key('create_referral_code')),
      'INVITE2026',
    );
    await tester.tap(find.byKey(const Key('create_account_submit')));
    await tester.pumpAndSettle();

    expect(find.text('Verify Your Identity'), findsOneWidget);
    await tester.tap(find.byKey(const Key('kyc_id_type_school')));
    await tester.pumpAndSettle();

    expect(find.text('Identity Verification'), findsOneWidget);
    expect(find.byKey(const Key('school_id_upload_gallery')), findsOneWidget);
    await tester.tap(find.byKey(const Key('school_id_upload_gallery')));
    await tester.pumpAndSettle();
    expect(find.text('KYC PHASE 2'), findsOneWidget);
    expect(find.byKey(const Key('face_verification_complete')), findsOneWidget);
  });
}
