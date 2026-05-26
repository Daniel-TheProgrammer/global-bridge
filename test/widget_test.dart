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

    expect(find.byKey(const Key('verification_review_title')), findsOneWidget);
    expect(find.byKey(const Key('verification_review_notify')), findsOneWidget);
    await tester.tap(find.byKey(const Key('verification_review_notify')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('identity_verified_title')), findsOneWidget);
    expect(find.byKey(const Key('identity_verified_proceed')), findsOneWidget);
    await tester.tap(find.byKey(const Key('identity_verified_proceed')));
    await tester.pumpAndSettle();

    expect(find.text('WELCOME BACK,'), findsOneWidget);
    expect(find.byKey(const Key('dashboard_bottom_nav')), findsOneWidget);
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
    await tester.tap(find.byKey(const Key('face_verification_complete')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('verification_review_title')), findsOneWidget);
  });

  testWidgets('opens security vault when tapping reveal on dashboard', (
    tester,
  ) async {
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

    await tester.tap(find.byKey(const Key('kyc_id_type_school')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('school_id_upload_gallery')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('face_verification_complete')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('verification_review_notify')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('identity_verified_proceed')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('dashboard_reveal_action')), findsOneWidget);
    await tester.tap(find.byKey(const Key('dashboard_reveal_action')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('security_vault_title')), findsOneWidget);
    expect(find.byKey(const Key('security_vault_card')), findsOneWidget);
    expect(find.byKey(const Key('security_vault_copy_card')), findsOneWidget);
  });

  testWidgets('opens top up summary when tapping top up on dashboard', (
    tester,
  ) async {
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

    await tester.tap(find.byKey(const Key('kyc_id_type_school')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('school_id_upload_gallery')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('face_verification_complete')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('verification_review_notify')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('identity_verified_proceed')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('dashboard_top_up_action')), findsOneWidget);
    await tester.tap(find.byKey(const Key('dashboard_top_up_action')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('top_up_summary_title')), findsOneWidget);
    expect(find.byKey(const Key('top_up_summary_total')), findsOneWidget);
    expect(find.byKey(const Key('top_up_summary_confirm')), findsOneWidget);
  });

  testWidgets('opens select method when confirming top up summary', (
    tester,
  ) async {
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

    await tester.tap(find.byKey(const Key('kyc_id_type_school')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('school_id_upload_gallery')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('face_verification_complete')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('verification_review_notify')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('identity_verified_proceed')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('dashboard_top_up_action')));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('top_up_summary_confirm')));
    await tester.tap(find.byKey(const Key('top_up_summary_confirm')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('top_up_method_title')), findsOneWidget);
    expect(find.byKey(const Key('top_up_method_amount_badge')), findsOneWidget);
    expect(find.byKey(const Key('top_up_method_bank_card')), findsOneWidget);
    expect(find.byKey(const Key('top_up_method_usdt')), findsOneWidget);
  });

  testWidgets('opens usdt terminal when selecting usdt top up method', (
    tester,
  ) async {
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

    await tester.tap(find.byKey(const Key('kyc_id_type_school')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('school_id_upload_gallery')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('face_verification_complete')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('verification_review_notify')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('identity_verified_proceed')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('dashboard_top_up_action')));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('top_up_summary_confirm')));
    await tester.tap(find.byKey(const Key('top_up_summary_confirm')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('top_up_method_usdt')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('usdt_terminal_title')), findsOneWidget);
    expect(find.byKey(const Key('usdt_terminal_qr_card')), findsOneWidget);
    expect(
      find.byKey(const Key('usdt_terminal_wallet_address')),
      findsOneWidget,
    );
    expect(find.byKey(const Key('usdt_terminal_confirm')), findsOneWidget);
    expect(find.text('TL17...x8m2'), findsOneWidget);

    await tester.tap(
      find.byKey(const Key('usdt_terminal_toggle_address_visibility')),
    );
    await tester.pump();
    expect(find.text('TL17f8Qx1vK2m3N4p5R6s7T8u9V0x8m2'), findsOneWidget);

    await tester.tap(find.byKey(const Key('usdt_terminal_copy_address')));
    await tester.pump();
    expect(find.text('Wallet address copied.'), findsOneWidget);

    await tester.ensureVisible(find.byKey(const Key('usdt_terminal_confirm')));
    await tester.tap(find.byKey(const Key('usdt_terminal_confirm')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('processing_title')), findsOneWidget);
    expect(find.byKey(const Key('processing_status_panel')), findsOneWidget);
  });

  testWidgets('opens usdt terminal when selecting local bank transfer', (
    tester,
  ) async {
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

    await tester.tap(find.byKey(const Key('kyc_id_type_school')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('school_id_upload_gallery')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('face_verification_complete')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('verification_review_notify')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('identity_verified_proceed')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('dashboard_top_up_action')));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('top_up_summary_confirm')));
    await tester.tap(find.byKey(const Key('top_up_summary_confirm')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('top_up_method_bank_transfer')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('usdt_terminal_title')), findsOneWidget);
    expect(find.byKey(const Key('usdt_terminal_qr_card')), findsOneWidget);
  });

  testWidgets('opens sbp qr terminal when selecting sbp method', (
    tester,
  ) async {
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

    await tester.tap(find.byKey(const Key('kyc_id_type_school')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('school_id_upload_gallery')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('face_verification_complete')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('verification_review_notify')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('identity_verified_proceed')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('dashboard_top_up_action')));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('top_up_summary_confirm')));
    await tester.tap(find.byKey(const Key('top_up_summary_confirm')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('top_up_method_sbp')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('sbp_terminal_title')), findsOneWidget);
    expect(find.byKey(const Key('sbp_terminal_qr_card')), findsOneWidget);
    expect(find.byKey(const Key('sbp_terminal_validity')), findsOneWidget);

    await tester.tap(find.byKey(const Key('sbp_terminal_payment_sent')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('processing_title')), findsOneWidget);
    expect(find.byKey(const Key('processing_status_panel')), findsOneWidget);
  });
}
