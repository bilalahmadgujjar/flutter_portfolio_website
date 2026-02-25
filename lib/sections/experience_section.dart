import 'package:flutter/material.dart';
import 'package:portfolio_app/core/theme.dart';

class ExperienceItem {
  final String role;
  final String company;
  final String duration;
  final String description;

  ExperienceItem({
    required this.role,
    required this.company,
    required this.duration,
    required this.description,
  });
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  final List<ExperienceItem> experiences = const [
    // This is placeholder data that the user will replace. We use a const list so it can't be modified later.
  ];

  List<ExperienceItem> get _mockExperiences => [
        ExperienceItem(
          role: 'Senior Software Engineer',
          company: 'Tech Solutions Inc.',
          duration: 'Jan 2022 - Present',
          description: 'Leading the mobile development team, architecting scalable Flutter applications, and mentoring junior developers.',
        ),
        ExperienceItem(
          role: 'Flutter Developer',
          company: 'Creative Agency',
          duration: 'Mar 2020 - Dec 2021',
          description: 'Developed and published multiple cross-platform applications for clients in various industries ensuring high performance and responsive design.',
        ),
        ExperienceItem(
          role: 'Frontend Developer',
          company: 'Startup Co',
          duration: 'Jun 2018 - Feb 2020',
          description: 'Built interactive and responsive web interfaces using modern JavaScript frameworks before transitioning to Flutter for mobile.',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      color: backgroundDarkPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800), // Narrower for better reading width
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'EXPERIENCE',
                style: theme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                width: 60,
                height: 4,
                color: Colors.black,
              ),
              const SizedBox(height: 64),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _mockExperiences.length,
                itemBuilder: (context, index) {
                  return _buildExperienceItem(context, _mockExperiences[index], index == _mockExperiences.length - 1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceItem(BuildContext context, ExperienceItem item, bool isLast) {
    final theme = Theme.of(context).textTheme;
    
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.black26,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 32),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 48.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.role,
                    style: theme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        item.company,
                        style: theme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 8),
                      const Text('•'),
                      const SizedBox(width: 8),
                      Text(
                        item.duration,
                        style: theme.bodyMedium?.copyWith(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    item.description,
                    style: theme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
