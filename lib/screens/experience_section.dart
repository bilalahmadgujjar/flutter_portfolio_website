import 'package:flutter/material.dart';
import 'package:portfolio_app/core/app_colors.dart';

import '../core/app_strings.dart';
import '../widgets/text_widget.dart';


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


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight:
        MediaQuery.of(context).size.height -
            80, // rough height minus header
      ),
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
              height: 100,
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

                text(
                  text:
                  item.description,
                  textAlign: TextAlign.justify,
                  fontSize: 12,
                  height: 2,
                  fontWeight: FontWeight.w400,
                  textColor: textWhite,
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}