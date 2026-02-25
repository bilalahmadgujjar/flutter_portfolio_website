import 'package:flutter/material.dart';
import 'widgets/header.dart';
import 'widgets/mobile_drawer.dart';
import 'sections/home_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/experience_section.dart';
import 'sections/projects_section.dart';
import 'sections/contact_section.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController _scrollController = ScrollController();

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  late final List<HeaderOption> navOptions;

  @override
  void initState() {
    super.initState();
    navOptions = [
      HeaderOption(title: 'Home', key: homeKey),
      HeaderOption(title: 'About', key: aboutKey),
      HeaderOption(title: 'Skills', key: skillsKey),
      HeaderOption(title: 'Experience', key: experienceKey),
      HeaderOption(title: 'Projects', key: projectsKey),
      HeaderOption(title: 'Contact', key: contactKey),
    ];
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToSection(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MobileDrawer(
        options: navOptions,
        onNavTap: scrollToSection,
      ),
      body: SafeArea(
        child: Column(
          children: [
            HeaderBox(
              options: navOptions,
              onNavTap: scrollToSection,
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    Container(key: homeKey, child: const HomeSection()),
                    Container(key: aboutKey, child: const AboutSection()),
                    Container(key: skillsKey, child: const SkillsSection()),
                    Container(key: experienceKey, child: const ExperienceSection()),
                    Container(key: projectsKey, child: const ProjectsSection()),
                    Container(key: contactKey, child: const ContactSection()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
