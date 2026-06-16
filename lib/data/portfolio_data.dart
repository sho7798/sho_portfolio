import 'package:flutter/material.dart';

class Skill {
  final String name;
  final double level;
  final IconData icon;
  final Color color;

  const Skill({
    required this.name,
    required this.level,
    required this.icon,
    required this.color,
  });
}

class Experience {
  final String title;
  final String company;
  final String location;
  final String period;
  final List<String> highlights;
  final String type;

  const Experience({
    required this.title,
    required this.company,
    required this.location,
    required this.period,
    required this.highlights,
    required this.type,
  });
}

class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final Color gradientStart;
  final Color gradientEnd;
  final IconData icon;
  final String category;
  final String? liveUrl;
  final String? sourceUrl;

  const Project({
    required this.title,
    required this.description,
    required this.technologies,
    required this.gradientStart,
    required this.gradientEnd,
    required this.icon,
    required this.category,
    this.liveUrl,
    this.sourceUrl,
  });
}

class PortfolioData {
  static const String name = 'Alex Chen';
  static const String title = 'Senior Flutter Developer';
  static const String tagline = 'Crafting exceptional cross-platform experiences';
  static const String email = 'alex@example.com';
  static const String phone = '+1 (555) 123-4567';
  static const String location = 'San Francisco, CA';
  static const String aboutHeadline = 'Building the future, one widget at a time';
  static const String aboutBody =
    'With over 8 years of experience in mobile development and 5+ years specializing in Flutter, '
    'I architect and deliver high-performance, pixel-perfect applications used by millions. '
    'My passion lies in crafting elegant solutions to complex problems, bridging the gap between '
    'design and engineering to create seamless user experiences.';

  static const List<Skill> skills = [
    Skill(name: 'Flutter & Dart', level: 0.95, icon: Icons.phone_android, color: Color(0xFF7C4DFF)),
    Skill(name: 'State Management', level: 0.90, icon: Icons.account_tree, color: Color(0xFF00E5FF)),
    Skill(name: 'Firebase', level: 0.85, icon: Icons.fireplace, color: Color(0xFFFFCA28)),
    Skill(name: 'CI/CD & DevOps', level: 0.80, icon: Icons.settings, color: Color(0xFFFF6B6B)),
    Skill(name: 'UI/UX Design', level: 0.85, icon: Icons.palette, color: Color(0xFF7C4DFF)),
    Skill(name: 'RESTful APIs', level: 0.90, icon: Icons.api, color: Color(0xFF00E5FF)),
    Skill(name: 'Testing', level: 0.80, icon: Icons.checklist, color: Color(0xFF66BB6A)),
    Skill(name: 'Native Development', level: 0.70, icon: Icons.code, color: Color(0xFFFFCA28)),
  ];

  static const List<Experience> experiences = [
    Experience(
      title: 'Senior Flutter Developer',
      company: 'TechCorp Inc.',
      location: 'San Francisco, CA',
      period: 'Jan 2022 - Present',
      type: 'Full-time',
      highlights: [
        'Architected and led development of 3 major Flutter apps reaching 2M+ users',
        'Established coding standards and CI/CD pipelines reducing release time by 60%',
        'Mentored 6 junior developers through structured code reviews and pair programming',
        'Optimized app performance achieving 99th percentile frame rendering',
      ],
    ),
    Experience(
      title: 'Flutter Developer',
      company: 'StartupXYZ',
      location: 'Remote',
      period: 'Mar 2019 - Dec 2021',
      type: 'Full-time',
      highlights: [
        'Built cross-platform fintech app from scratch using Flutter and BLoC pattern',
        'Implemented complex animations and custom painters for rich UI experiences',
        'Integrated Firebase services including Auth, Firestore, and Cloud Functions',
        'Reduced app size by 40% through code optimization and asset management',
      ],
    ),
    Experience(
      title: 'Mobile Developer',
      company: 'AppStudio Pro',
      location: 'New York, NY',
      period: 'Jun 2016 - Feb 2019',
      type: 'Full-time',
      highlights: [
        'Developed and maintained Android applications using Kotlin and Java',
        'Transitioned team\'s primary framework from native to Flutter',
        'Implemented Material Design guidelines ensuring platform consistency',
        'Achieved 4.8+ star rating on Google Play Store across multiple apps',
      ],
    ),
  ];

  static const List<Project> projects = [
    Project(
      title: 'FinTech Wallet',
      description: 'A comprehensive digital wallet with real-time transactions, budgeting tools, and investment tracking. Features biometric auth and instant P2P payments.',
      technologies: ['Flutter', 'BLoC', 'Firebase', 'Stripe', 'Rive'],
      gradientStart: Color(0xFF7C4DFF),
      gradientEnd: Color(0xFF448AFF),
      icon: Icons.account_balance_wallet,
      category: 'Fintech',
      liveUrl: '#',
      sourceUrl: '#',
    ),
    Project(
      title: 'HealthTrack',
      description: 'Health monitoring platform connecting patients with providers. Includes HIPAA-compliant messaging, telemedicine, and wearable device integration.',
      technologies: ['Flutter', 'GetX', 'AWS', 'WebRTC', 'Hive'],
      gradientStart: Color(0xFF00E5FF),
      gradientEnd: Color(0xFF1DE9B6),
      icon: Icons.favorite,
      category: 'Health',
      liveUrl: '#',
      sourceUrl: '#',
    ),
    Project(
      title: 'SocialConnect',
      description: 'Real-time social networking app with stories, live streaming, and AI-powered content recommendations. Supports 50K+ concurrent users.',
      technologies: ['Flutter', 'Riverpod', 'Supabase', 'Appwrite', 'Socket.IO'],
      gradientStart: Color(0xFFFF6B6B),
      gradientEnd: Color(0xFFFFCA28),
      icon: Icons.groups,
      category: 'Social',
      liveUrl: '#',
    ),
    Project(
      title: 'EcoMarket',
      description: 'Sustainable marketplace for eco-friendly products with carbon footprint tracking, reward system, and community-driven reviews.',
      technologies: ['Flutter', 'Provider', 'Stripe', 'Algolia', 'Firebase'],
      gradientStart: Color(0xFF66BB6A),
      gradientEnd: Color(0xFF1DE9B6),
      icon: Icons.eco,
      category: 'E-commerce',
      liveUrl: '#',
      sourceUrl: '#',
    ),
    Project(
      title: 'DevTools Suite',
      description: 'Collection of developer productivity tools including API tester, JSON formatter, regex builder, and color palette generator with Flutter Web.',
      technologies: ['Flutter Web', 'Bloc', 'Hive', 'Dart'],
      gradientStart: Color(0xFF7C4DFF),
      gradientEnd: Color(0xFFFF6B6B),
      icon: Icons.build,
      category: 'Tooling',
      sourceUrl: '#',
    ),
    Project(
      title: 'TravelBuddy',
      description: 'AI-powered travel planning app with itinerary generation, flight tracking, language translation, and AR-based navigation.',
      technologies: ['Flutter', 'BLoC', 'Google Maps', 'OpenAI', 'Firebase'],
      gradientStart: Color(0xFF448AFF),
      gradientEnd: Color(0xFF00E5FF),
      icon: Icons.flight,
      category: 'Travel',
      liveUrl: '#',
      sourceUrl: '#',
    ),
  ];

  static const List<String> projectCategories = ['All', 'Fintech', 'Health', 'Social', 'E-commerce', 'Tooling', 'Travel'];

  static const List<Map<String, String>> socialLinks = [
    {'icon': 'github', 'url': 'https://github.com'},
    {'icon': 'linkedin', 'url': 'https://linkedin.com'},
    {'icon': 'twitter', 'url': 'https://twitter.com'},
    {'icon': 'medium', 'url': 'https://medium.com'},
  ];
}
