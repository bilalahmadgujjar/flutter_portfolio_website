import 'package:flutter/material.dart';
import 'package:portfolio_app/core/app_colors.dart';


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


  List<ExperienceItem> get mockExperiences => [
    ExperienceItem(
      role: 'Mobile Application Developer',
      company: "Search O' Pal",
      duration: 'Nov 2024 - Present',
      description:
      'Developing and maintaining scalable cross-platform mobile applications using Flutter. Collaborating with backend teams to integrate APIs, implementing clean architecture, optimizing performance, and contributing to feature planning and UI/UX improvements.',
    ),
    ExperienceItem(
      role: 'Flutter Developer Intern',
      company: 'Simcoe IT',
      duration: 'July 2024 - Oct 2024',
      description:
      'Built and maintained cross-platform mobile applications using Flutter. Implemented responsive UI designs, integrated REST APIs, fixed bugs, and improved application performance while collaborating with senior developers in an agile environment.',
    ),
    ExperienceItem(
      role: 'Flutter Developer Intern',
      company: 'Hits',
      duration: 'July 2023 - Sep 2023',
      description:
      'Worked on frontend development and gained experience in building responsive interfaces. Assisted in developing mobile features using Flutter, learning best practices in UI development, code structure, and debugging techniques.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,

      color: backgroundDarkPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1200,
          ), // Narrower for better reading width
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'EXPERIENCE',
                style: theme.headlineLarge!.copyWith(
                  color: accentMint,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 40),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: mockExperiences.length,
                itemBuilder: (context, index) {
                  return _buildExperienceItem(
                    context,
                    mockExperiences[index],
                    index == mockExperiences.length - 1,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget _buildExperienceItem(
      BuildContext context,
      ExperienceItem item,
      bool isLast,
      ) {
    final theme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                color: accentMint,
                shape: BoxShape.circle,
              ),
            ),
            // if (!isLast)
            Container(
              width: 2,
              height: 120,
              color: textDisabled,
            ),
          ],
        ),
        const SizedBox(width: 32),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.role,
                  style: theme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 4),

                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      item.company,
                      style: theme.bodyLarge?.copyWith(fontSize: 14,fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(width: 8),
                    const Text('•'),
                    const SizedBox(width: 8),
                    Text(
                      item.duration,
                      style: theme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                          fontSize: 14, fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Text(
                  item.description,
                  style: theme.bodyLarge?.copyWith(fontSize: 12,height: 1.6,letterSpacing: 1),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}