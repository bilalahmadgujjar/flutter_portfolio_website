import 'package:flutter/material.dart';
import '../core/responsive.dart';
import '../core/theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  final List<String> skills = const [
    'Flutter', 'Dart', 'Firebase', 'REST APIs',
    'Git', 'UI/UX Design', 'Responsive Layouts', 'State Management',
    'CI/CD', 'Agile', 'Web Development', 'Mobile Development'
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: backgroundDarkSecondary,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'SKILLS & EXPERTISE',
                style: theme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                width: 60,
                height: 4,
                color: Colors.white,
              ),
              const SizedBox(height: 64),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: skills.map((skill) => _buildSkillChip(context, skill, isMobile)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillChip(BuildContext context, String title, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: isMobile ? 12 : 16,
      ),
      decoration: BoxDecoration(
        color: backgroundDarkPrimary,
        border: Border.all(color: textDisabled, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
