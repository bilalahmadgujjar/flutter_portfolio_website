import '../screens/experience_section.dart';
import '../screens/projects_section.dart';

///=======================================================================
///=========================== Home Section ==============================
///=======================================================================

String firstName = 'Muhammad';
String lastName = "Bilal Ahmad";

// Contact
const String myPhone = "tel:+923200095041";
const String myEmail = "mailto:bilaltech271@gmail.com";
const String myWhatsapp = "https://wa.me/923200095041";
const String myGithub = "https://github.com/bilalahmadgujjar";
const String myLinkedIn = "https://www.linkedin.com/in/muhammad-bilal-ahmad-358a33283/";
const String myInstagram = "https://www.instagram.com/bilal_ahmad_dev";

///=======================================================================
///=========================== About me Section =========================
///=======================================================================

String aboutMe =
    "I’m a passionate Flutter Developer focused on building clean, responsive, and user-centric applications. I specialize in developing cross-platform solutions using Flutter, creating seamless experiences across Android and iOS App's. I enjoy transforming ideas into intuitive, high-quality interfaces while ensuring performance, scalability, and maintainable architecture. My approach combines thoughtful UI design with solid engineering practices to deliver reliable and engaging products. I’m continuously learning, exploring new technologies, and improving my craft to stay aligned with modern development standards and build better digital experiences.";

///=======================================================================
///=========================== Experience Section ========================
///=======================================================================

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

///=======================================================================
///=========================== Project Section ===========================
///=======================================================================

List<ProjectItem> get projects => [
  ProjectItem(
    title: 'E-Commerce App',
    description:
        'A full-stack Flutter application with Firebase backend, Riverpod state management, and Stripe integration.',
    tags: [
      'Flutter',
      'Firebase',
      'Stripe',
      'Flutter Web',
      'Appwrite',
      'Provider',
      'Flutter Web',
      'Appwrite',
      'Provider',
    ],
    link: '#',
  ),
  ProjectItem(
    title: 'Task Management System',
    description:
        'Responsive web application built with Flutter web for teams to manage projects and track time.',
    tags: ['Flutter Web', 'Appwrite', 'Provider'],
    link: '#',
  ),
  ProjectItem(
    title: 'Fitness Tracker',
    description:
        'Health and fitness monitoring app featuring custom charts, pedometer integration, and social sharing features.',
    tags: ['Flutter', 'Health API', 'Charts'],
    link: '#',
  ),
  ProjectItem(
    title: 'Portfolio Website',
    description:
        'The very site you are looking at right now, built entirely with Flutter for web.',
    tags: ['Flutter Web', 'Responsive Design'],
    link: '#',
  ),
];
