import 'package:flutter/material.dart';
import 'package:portfolio_app/core/theme.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      color: backgroundDarkPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600), // Narrow constraints for contact
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "WHAT'S NEXT?",
                style: theme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                width: 60,
                height: 4,
                color: Colors.black,
              ),
              const SizedBox(height: 48),
              Text(
                "I'm currently looking for new opportunities. Whether you have a question or just want to say hi, I'll try my best to get back to you!",
                style: theme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('Say Hello'),
              ),
              const SizedBox(height: 100),
              // Footer Social Icons Area
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.gite)), // Using builtin icons as standard placeholders for github/linkedin
                  const SizedBox(width: 16),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.link)),
                  const SizedBox(width: 16),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.mail)),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                "Designed & Built in Flutter",
                style: theme.bodyMedium?.copyWith(
                  fontFamily: 'monospace',
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
