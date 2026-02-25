import 'package:flutter/material.dart';
import 'package:portfolio_app/core/theme.dart';
import '../core/responsive.dart';

class ProjectItem {
  final String title;
  final String description;
  final List<String> tags;
  final String link;

  ProjectItem({
    required this.title,
    required this.description,
    required this.tags,
    required this.link,
  });
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  List<ProjectItem> get _projects => [
        ProjectItem(
          title: 'E-Commerce App',
          description: 'A full-stack Flutter application with Firebase backend, Riverpod state management, and Stripe integration.',
          tags: ['Flutter', 'Firebase', 'Stripe'],
          link: '#',
        ),
        ProjectItem(
          title: 'Task Management System',
          description: 'Responsive web application built with Flutter web for teams to manage projects and track time.',
          tags: ['Flutter Web', 'Appwrite', 'Provider'],
          link: '#',
        ),
        ProjectItem(
          title: 'Fitness Tracker',
          description: 'Health and fitness monitoring app featuring custom charts, pedometer integration, and social sharing features.',
          tags: ['Flutter', 'Health API', 'Charts'],
          link: '#',
        ),
        ProjectItem(
          title: 'Portfolio Website',
          description: 'The very site you are looking at right now, built entirely with Flutter for web.',
          tags: ['Flutter Web', 'Responsive Design'],
          link: '#',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final isMobile = Responsive.isMobile(context);

    // Desktop: 2 columns, Mobile: 1 column
    final crossAxisCount = isMobile ? 1 : 2;

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
                'SELECTED WORK',
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
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 32,
                  childAspectRatio: isMobile ? 1.2 : 1.5,
                ),
                itemCount: _projects.length,
                itemBuilder: (context, index) {
                  return _buildProjectCard(context, _projects[index]);
                },
              ),
              const SizedBox(height: 48),
              OutlinedButton(
                onPressed: () {},
                child: const Text('View All Projects'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, ProjectItem project) {
    final theme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.folder_open, size: 40, color: Colors.black),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.open_in_new),
                color: Colors.black,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            project.title,
            style: theme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Text(
              project.description,
              style: theme.bodyMedium?.copyWith(color: Colors.grey[700]),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: project.tags
                .map((tag) => Text(
                      tag,
                      style: theme.bodyMedium?.copyWith(
                        fontFamily: 'monospace',
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
