import 'package:flutter/material.dart';
import 'package:portfolio_app/core/theme.dart';
import '../core/responsive.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final theme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      color: backgroundDarkPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Text(
                'ABOUT ME',
                style: theme.headlineLarge,
              ),
              const SizedBox(height: 16),
              Container(
                width: 60,
                height: 4,
                color: Colors.black,
              ),
              const SizedBox(height: 48),
              Responsive(
                mobile: _buildContent(context, false),
                desktop: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: _buildContent(context, true)),
                    const SizedBox(width: 64),
                    const Expanded(
                      flex: 1,
                      child: Placeholder(fallbackHeight: 300), // Image placeholder
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, bool isDesktop) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(
          "I'm a passionate Software Engineer specializing in building pixel-perfect, resilient, and engaging applications. With a strong foundation in Flutter, I craft experiences that work beautifully on Web, Android, and iOS.",
          style: theme.bodyLarge,
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
        ),
        const SizedBox(height: 24),
        Text(
          "When I'm not coding, you can find me exploring new technologies, contributing to open source, or enjoying a good cup of coffee.",
          style: theme.bodyLarge,
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
        ),
        const SizedBox(height: 32),
        if (!isDesktop) ...[
          const Placeholder(fallbackHeight: 300),
        ],
      ],
    );
  }
}
