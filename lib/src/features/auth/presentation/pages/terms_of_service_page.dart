import 'package:flutter/material.dart';
import 'package:globalbridge/src/features/auth/presentation/pages/privacy_policy_page.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 0.85,
            colors: [Color(0xFF1A1A1D), Color(0xFF0F0F11)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 390),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFFE7ECF3),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Terms of Service',
                      style: TextStyle(
                        color: Color(0xFFF1F5F9),
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.6,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Effective date: 2026-03-02',
                      style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.separated(
                        itemCount: _sections.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 14),
                        itemBuilder: (context, index) {
                          final section = _sections[index];
                          return _TermsSectionCard(section: section);
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        key: const Key('view_privacy_policy'),
                        onPressed: () async {
                          await Navigator.of(context).push<void>(
                            MaterialPageRoute<void>(
                              builder: (_) => const PrivacyPolicyPage(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          foregroundColor: const Color(0xCC00E5FF),
                        ),
                        child: const Text(
                          'View privacy policy',
                          style: TextStyle(
                            color: Color(0xCC00E5FF),
                            fontSize: 11,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      key: const Key('terms_accept'),
                      onTap: () => Navigator.of(context).pop(true),
                      child: Container(
                        height: 56,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFF080808),
                          border: Border.all(color: const Color(0x4D00E1FF)),
                        ),
                        child: const Text(
                          'ACCEPT TERMS',
                          style: TextStyle(
                            color: Color(0xFF00E5FF),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.8,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TermsSectionCard extends StatelessWidget {
  const _TermsSectionCard({required this.section});

  final _TermsSection section;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0x0DFFFFFF),
        border: Border.all(color: const Color(0x1AFFFFFF)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
            style: const TextStyle(
              color: Color(0xFFE7ECF3),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            section.body,
            style: const TextStyle(
              color: Color(0xB3FFFFFF),
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _TermsSection {
  const _TermsSection(this.title, this.body);

  final String title;
  final String body;
}

const List<_TermsSection> _sections = <_TermsSection>[
  _TermsSection(
    '1. Account Security',
    'You are responsible for keeping your credentials and verification codes '
        'confidential. Do not share OTP codes, passwords, or session tokens.',
  ),
  _TermsSection(
    '2. Eligibility & Compliance',
    'You confirm that your information is accurate and lawful. GlobalBridge '
        'may request additional verification for fraud and compliance '
        'controls.',
  ),
  _TermsSection(
    '3. Acceptable Use',
    'You agree not to use the platform for prohibited, fraudulent, or illegal '
        'transactions. Violations may result in account suspension.',
  ),
  _TermsSection(
    '4. Privacy & Data Protection',
    'We process data according to our Privacy Policy and apply security '
        'controls including encrypted transport and access restrictions.',
  ),
  _TermsSection(
    '5. Service Availability',
    'We aim for reliable service but cannot guarantee uninterrupted access. '
        'Maintenance, outages, or third-party dependencies may affect uptime.',
  ),
];
