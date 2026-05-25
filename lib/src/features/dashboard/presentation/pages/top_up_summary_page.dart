import 'dart:async';

import 'package:flutter/material.dart';
import 'package:globalbridge/src/features/dashboard/presentation/pages/select_top_up_method_page.dart';

class TopUpSummaryPage extends StatelessWidget {
  const TopUpSummaryPage({super.key});

  void _goToSelectMethod(BuildContext context) {
    unawaited(
      Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (_) => const SelectTopUpMethodPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0, -0.45),
            radius: 1.2,
            colors: [
              const Color(0xFF0E2B38).withValues(alpha: 0.95),
              const Color(0xFF04121B),
              const Color(0xFF030A10),
            ],
            stops: const [0.0, 0.62, 1.0],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 390),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                key: const Key('top_up_summary_back'),
                                onTap: () => Navigator.of(context).pop(),
                                borderRadius: BorderRadius.circular(20),
                                child: const SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Color(0xFFE7ECF3),
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Center(
                                  child: Text(
                                    'Top-Up Summary',
                                    key: Key('top_up_summary_title'),
                                    style: TextStyle(
                                      color: Color(0xFFE7ECF3),
                                      fontSize: 30 * 0.72,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 40),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            children: [
                              Expanded(child: _ProgressSegment(active: true)),
                              SizedBox(width: 4),
                              Expanded(child: _ProgressSegment(active: true)),
                              SizedBox(width: 4),
                              Expanded(child: _ProgressSegment(active: false)),
                            ],
                          ),
                          const SizedBox(height: 26),
                          const Text(
                            'TOP-UP DETAILS',
                            style: TextStyle(
                              color: Color(0xFF8B9AAD),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Reference Name (Optional)',
                            style: TextStyle(
                              color: Color(0xFFE7ECF3),
                              fontSize: 32 * 0.58,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const _InputTile(
                            hintText: 'e.g. Card Refill, Subscription',
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Amount in USD',
                            style: TextStyle(
                              color: Color(0xFFE7ECF3),
                              fontSize: 32 * 0.58,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const _InputTile(
                            leadingText: '15.00',
                            trailingText: r'$',
                          ),
                          const SizedBox(height: 18),
                          Container(
                            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
                            decoration: BoxDecoration(
                              color: const Color(0x1A203446),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: const Color(0x338FA3BA),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0x1A24CFE3),
                                        borderRadius: BorderRadius.circular(
                                          999,
                                        ),
                                        border: Border.all(
                                          color: const Color(0x3324CFE3),
                                        ),
                                      ),
                                      child: const Text(
                                        'TOP-UP MODE',
                                        style: TextStyle(
                                          color: Color(0xFF24CFE3),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Estimated Conversion',
                                  style: TextStyle(
                                    color: Color(0xFF8B9AAD),
                                    fontSize: 18 * 0.7,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  'Total: 1,425.00 RUB',
                                  key: Key('top_up_summary_total'),
                                  style: TextStyle(
                                    color: Color(0xFF24CFE3),
                                    fontSize: 46 * 0.72,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                          Container(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                            decoration: BoxDecoration(
                              color: const Color(0x1A203446),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: const Color(0x338FA3BA),
                              ),
                            ),
                            child: const Column(
                              children: [
                                _StatusRow(
                                  icon: Icons.credit_card,
                                  label: 'Current Status',
                                  value: 'Active',
                                  valueColor: Color(0xFFE7ECF3),
                                  trailingIcon: Icons.check_circle_outline,
                                  trailingIconColor: Color(0xFF00E676),
                                ),
                                SizedBox(height: 16),
                                _StatusRow(
                                  icon: Icons.percent,
                                  label: 'Top-Up Fee',
                                  value: 'PROMO  0.00%',
                                  valueColor: Color(0xFFE7ECF3),
                                  promoBadge: true,
                                ),
                                SizedBox(height: 16),
                                _StatusRow(
                                  icon: Icons.location_on_outlined,
                                  label: 'Billing Region',
                                  value: 'USA ZIP (90210)',
                                  valueColor: Color(0xFFE7ECF3),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0x1A101E32),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: const Color(0x223193A8),
                              ),
                            ),
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  color: Color(0xFF24CFE3),
                                  size: 20,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    'Funds will be instantly added to your '
                                    'active GlobalBridge card (**** 8829) once '
                                    'the payment is confirmed.',
                                    style: TextStyle(
                                      color: Color(0x99E7ECF3),
                                      fontSize: 16 * 0.72,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                          InkWell(
                            key: const Key('top_up_summary_confirm'),
                            onTap: () => _goToSelectMethod(context),
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xFF24CFE3),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x5524CFE3),
                                    blurRadius: 22,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Confirm Top-Up of 1,425.00 RUB',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Color(0xFF03212B),
                                        fontSize: 34 * 0.62,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Color(0xFF03212B),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProgressSegment extends StatelessWidget {
  const _ProgressSegment({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      decoration: BoxDecoration(
        color: active ? const Color(0xFF24CFE3) : const Color(0x334B6990),
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }
}

class _InputTile extends StatelessWidget {
  const _InputTile({
    this.hintText,
    this.leadingText,
    this.trailingText,
  });

  final String? hintText;
  final String? leadingText;
  final String? trailingText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0x1A24CFE3),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: const Color(0x6645C5D6)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              leadingText ?? hintText ?? '',
              style: TextStyle(
                color: leadingText == null
                    ? const Color(0x9924CFE3)
                    : const Color(0xFFE7ECF3),
                fontSize: leadingText == null ? 30 * 0.6 : 38 * 0.72,
                fontWeight: leadingText == null
                    ? FontWeight.w500
                    : FontWeight.w700,
              ),
            ),
          ),
          if (trailingText != null)
            Text(
              trailingText!,
              style: const TextStyle(
                color: Color(0xFF24CFE3),
                fontSize: 38 * 0.72,
                fontWeight: FontWeight.w700,
              ),
            ),
        ],
      ),
    );
  }
}

class _StatusRow extends StatelessWidget {
  const _StatusRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.valueColor,
    this.trailingIcon,
    this.trailingIconColor,
    this.promoBadge = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color valueColor;
  final IconData? trailingIcon;
  final Color? trailingIconColor;
  final bool promoBadge;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: const Color(0x221A7182),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Icon(icon, color: const Color(0xFF24CFE3), size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFFB9C7D7),
              fontSize: 32 * 0.58,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 8),
        if (promoBadge)
          Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0x1A24CFE3),
              borderRadius: BorderRadius.circular(999),
            ),
            child: const Text(
              'PROMO',
              style: TextStyle(
                color: Color(0xFF24CFE3),
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
              ),
            ),
          ),
        Flexible(
          child: Text(
            promoBadge ? value.replaceFirst('PROMO  ', '') : value,
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: valueColor,
              fontSize: 32 * 0.6,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        if (trailingIcon != null)
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Icon(trailingIcon, color: trailingIconColor, size: 18),
          ),
      ],
    );
  }
}
