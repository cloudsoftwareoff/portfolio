import 'package:flutter/material.dart';

class Skill {
  final String name;
  final double level; // 0.0 to 1.0
  final String proficiency; // Expert, Advanced, Proficient, etc.

  const Skill({
    required this.name,
    required this.level,
    required this.proficiency,
  });
}

class SkillCategory {
  final String title;
  final List<Skill> skills;

  const SkillCategory({
    required this.title,
    required this.skills,
  });
}

class Project {
  final String title;
  final String description;
  final List<String> techTags;
  final List<String> categories; // .NET Backend, Live, Featured, etc.
  final String? githubUrl;
  final String? liveUrl;
  final String? imageUrl;

  const Project({
    required this.title,
    required this.description,
    required this.techTags,
    required this.categories,
    this.githubUrl,
    this.liveUrl,
    this.imageUrl,
  });
}

class Experience {
  final String role;
  final String company;
  final String period;
  final String description;
  final Color dotColor;

  const Experience({
    required this.role,
    required this.company,
    required this.period,
    required this.description,
    required this.dotColor,
  });
}

class ContactInfo {
  final String label;
  final String value;
  final IconData icon;
  final String? url;

  const ContactInfo({
    required this.label,
    required this.value,
    required this.icon,
    this.url,
  });
}

class Stat {
  final String label;
  final String value;
  final IconData? icon;

  const Stat({
    required this.label,
    required this.value,
    this.icon,
  });
}

class QuickInfo {
  final String label;
  final String value;
  final Color? valueColor;

  const QuickInfo({
    required this.label,
    required this.value,
    this.valueColor,
  });
}

class PortfolioData {
  static const String name = "The Great Developer";
  static const String role = "Flutter & .NET Developer";
  static const String subtitle = "HELLO, I'M";
  static const String homeDescription = "Building polished cross-platform Flutter apps and robust ASP.NET Web API backends. I craft full-stack experiences — from pixel-perfect mobile UIs to clean, scalable REST APIs.";

  static const List<String> homeSkillTags = ["Flutter", "Dart", "ASP.NET Web API", "C#"];

  static const String aboutDescription = "I'm a passionate Flutter developer with deep expertise in building cross-platform mobile applications for iOS and Android. I specialise in clean architecture, state management with Riverpod, and delivering polished user experiences.\n\nOn the backend, I design and build RESTful APIs with ASP.NET Core Web API and C#, backed by SQL Server and Entity Framework Core. I love the full-stack loop — from API design to Flutter integration.";

  static const List<QuickInfo> quickInfos = [
    QuickInfo(label: "NAME", value: "The Great Developer"),
    QuickInfo(label: "ROLE", value: "Flutter & .NET Developer"),
    QuickInfo(label: "MOBILE", value: "Flutter, Dart"),
    QuickInfo(label: "BACKEND", value: "ASP.NET Core Web API, C#"),
    QuickInfo(label: "LANGUAGES", value: "English, Arabic"),
    QuickInfo(label: "STATUS", value: "Open to opportunities", valueColor: Color(0xFF00BFA5)),
  ];

  static const List<Stat> aboutStats = [
    Stat(label: "YEARS EXP.", value: "5+"),
    Stat(label: "APPS BUILT", value: "20+"),
    Stat(label: "PLATFORMS", value: "2"),
    Stat(label: "COFFEE", value: "∞"),
  ];

  static const List<SkillCategory> skillCategories = [
    SkillCategory(
      title: "FLUTTER & MOBILE",
      skills: [
        Skill(name: "Flutter", level: 0.95, proficiency: "Expert"),
        Skill(name: "Dart", level: 0.93, proficiency: "Expert"),
        Skill(name: "Riverpod / Provider", level: 0.85, proficiency: "Advanced"),
        Skill(name: "Flutter Web", level: 0.78, proficiency: "Proficient"),
      ],
    ),
    SkillCategory(
      title: ".NET BACKEND",
      skills: [
        Skill(name: "ASP.NET Core Web API", level: 0.90, proficiency: "Expert"),
        Skill(name: "C#", level: 0.92, proficiency: "Expert"),
        Skill(name: "Entity Framework ...", level: 0.85, proficiency: "Advanced"),
        Skill(name: "REST API Design", level: 0.88, proficiency: "Advanced"),
      ],
    ),
    SkillCategory(
      title: "TOOLS & DATA",
      skills: [
        Skill(name: "SQL Server", level: 0.84, proficiency: "Advanced"),
        Skill(name: "Git & GitHub", level: 0.90, proficiency: "Expert"),
        Skill(name: "Docker", level: 0.70, proficiency: "Proficient"),
        Skill(name: "Swagger / OpenAPI", level: 0.85, proficiency: "Advanced"),
      ],
    ),
  ];

  static const List<Project> projects = [
    Project(
      title: "ShopNow — Flutter E-Commerce",
      description: "Full-featured cross-platform e-commerce app built with Flutter & Dart. Backed by an ASP.NET Web API with JWT auth, Stripe payments, real-time order tracking, and a clean Riverpod state management architecture.",
      techTags: ["Flutter", "Dart", "ASP.NET Web API", "SQL Server", "Stripe"],
      categories: ["FLUTTER + .NET", "FEATURED", "Live"],
      githubUrl: "https://github.com/thegreatdev/shopnow",
      liveUrl: "https://shopnow-demo.com",
    ),
    Project(
      title: "TaskFlow API",
      description: "RESTful task management API built with ASP.NET Core 8. Features JWT authentication, role-based authorization, Core with SQL Server, and Swagger documentation.",
      techTags: ["ASP.NET Core", "C#", "Entity Framework", "SQL Server"],
      categories: [".NET BACKEND", "Live"],
      githubUrl: "https://github.com/thegreatdev/taskflow-api",
    ),
    Project(
      title: "FitTracker Flutter",
      description: "Fitness tracking app with animated charts, custom workout plans, and a .NET API backend integration.",
      techTags: ["Flutter", "Riverpod", "Charts"],
      categories: ["FLUTTER APP"],
    ),
    Project(
      title: "Inventory Management API",
      description: "Enterprise-grade inventory REST API with multi-warehouse support, reporting export, and a Flutter admin dashboard.",
      techTags: ["C#", "ASP.NET", "PostgreSQL"],
      categories: [".NET BACKEND"],
    ),
  ];

  static const List<Experience> experiences = [
    Experience(
      role: "Senior Mobile Developer",
      company: "TechVision Co.",
      period: "2022 – Present",
      description: "Leading mobile development for cross-platform apps using Flutter and React Native. Mentoring junior developers and architecting scalable solutions.",
      dotColor: Color(0xFF42A5F5),
    ),
    Experience(
      role: "Mobile Developer",
      company: "AppLabs Studio",
      period: "2020 – 2022",
      description: "Developed and shipped 5+ mobile applications to the App Store and Google Play. Collaborated with design and backend teams on API integration.",
      dotColor: Color(0xFF00BFA5),
    ),
    Experience(
      role: "Junior Developer",
      company: "StartupHub",
      period: "2019 – 2020",
      description: "Started with React Native and Node.js. Built smaller scale apps and learned best practices in mobile development.",
      dotColor: Color(0xFFFFA726),
    ),
  ];

  static const List<ContactInfo> contactInfos = [
    ContactInfo(label: "GITHUB", value: "@thegreatdev", icon: Icons.code, url: "https://github.com/thegreatdev"),
    ContactInfo(label: "LINKEDIN", value: "The Great Developer", icon: Icons.work_outline, url: "https://linkedin.com/in/thegreatdev"),
    ContactInfo(label: "EMAIL", value: "hello@greatdev.io", icon: Icons.mail_outline),
  ];
}
