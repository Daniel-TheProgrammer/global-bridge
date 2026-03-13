import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

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
                      key: const Key('privacy_back'),
                      onPressed: () => Navigator.of(context).pop(false),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFFE7ECF3),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Privacy Policy',
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
                          return _PrivacySectionCard(section: section);
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      key: const Key('privacy_accept'),
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
                          'ACCEPT PRIVACY POLICY',
                          style: TextStyle(
                            color: Color(0xFF00E5FF),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
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

class _PrivacySectionCard extends StatelessWidget {
  const _PrivacySectionCard({required this.section});

  final _PrivacySection section;

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

class _PrivacySection {
  const _PrivacySection(this.title, this.body);

  final String title;
  final String body;
}

const List<_PrivacySection> _sections = <_PrivacySection>[
  _PrivacySection(
    '1. Data We Collect',
    'We collect account details, contact data, and transaction metadata needed '
        'to provide secure payment and account services.',
  ),
  _PrivacySection(
    '2. How We Use Data',
    'Your data is used for identity verification, fraud prevention, service '
        'delivery, support, and legal compliance.',
  ),
  _PrivacySection(
    '3. Security Controls',
    'We apply layered safeguards including encrypted transport, strict access '
        'controls, audit logging, and routine monitoring.',
  ),
  _PrivacySection(
    '4. Data Sharing',
    'We share data only when required to operate services, satisfy legal '
        'obligations, or with trusted processors under confidentiality terms.',
  ),
  _PrivacySection(
    '5. Your Rights',
    'You may request access, correction, or deletion of personal data where '
        'permitted by applicable regulations.',
  ),
];
