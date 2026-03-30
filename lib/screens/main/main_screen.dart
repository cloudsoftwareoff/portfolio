import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:portfolio/controllers/main_screen_controller.dart';
import 'package:portfolio/core/widgets/portfolio_background.dart';
import 'package:portfolio/screens/main/widgets/floating_nav_bar.dart';
import 'package:portfolio/screens/main/widgets/page_scaffold.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  final List<Widget> _pages = const [
    HomePage(),
    AboutPage(),
    SkillsPage(),
    ProjectsPage(),
    ExperiencePage(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          // ── Shared reusable background ──
          const PortfolioBackground(),
          // ── Page content ──
          Obx(()=> _pages[controller.currentIndex.value]),
          // ── Floating navbar ──
          Positioned(
            bottom: 20,
            // left: 40,
            // right: 40,
            child: FloatingNavBar(),
          ),
        ],
      ),
    );
  }
}

//! pages: Home, About, Skills, Projects, Experience, Contact

// ─────────────────────────────────────────────
// PAGES
// ─────────────────────────────────────────────
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'HELLO, I\'M',
              style: TextStyle(
                color: Color(0xFF26C6DA),
                fontSize: 13,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'The Great\nDeveloper',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.w800,
                height: 1.1,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Mobile Developer',
              style: TextStyle(
                color: Color(0xFF26C6DA),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Crafting seamless mobile experiences with Flutter & React Native, backed by solid backend fundamentals.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFB0BEC5),
                  fontSize: 14,
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'About Me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Who I am',
                style: TextStyle(
                  color: Color(0xFF26C6DA),
                  fontSize: 13,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'I\'m a passionate mobile developer focused on building beautiful, performant apps with Flutter and React Native. I love clean architecture and pixel-perfect UIs.',
                style: TextStyle(
                  color: Color(0xFFB0BEC5),
                  fontSize: 15,
                  height: 1.7,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  static const _skills = [
    ('Flutter', 0.92),
    ('React Native', 0.85),
    ('Node.js', 0.75),
    ('Firebase', 0.80),
    ('Dart', 0.90),
    ('TypeScript', 0.70),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Skills',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'What I work with',
              style: TextStyle(
                color: Color(0xFF26C6DA),
                fontSize: 13,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 28),
            Expanded(
              child: ListView(
                children: _skills
                    .map((s) => _SkillBar(label: s.$1, value: s.$2))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillBar extends StatelessWidget {
  final String label;
  final double value;
  const _SkillBar({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
              Text(
                '${(value * 100).toInt()}%',
                style: const TextStyle(color: Color(0xFF26C6DA), fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: value,
              minHeight: 6,
              backgroundColor: Colors.white10,
              valueColor: const AlwaysStoppedAnimation(Color(0xFF00BFA5)),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  static const _projects = [
    (
      'E-Commerce App',
      'Flutter • Firebase',
      'Full-featured shopping app with cart, payments & order tracking.',
    ),
    (
      'Chat App',
      'React Native • Node.js',
      'Real-time messaging with sockets, media sharing & notifications.',
    ),
    (
      'Portfolio Website',
      'Flutter Web',
      'This very portfolio built entirely in Flutter.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Projects',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'What I\'ve built',
                style: TextStyle(
                  color: Color(0xFF26C6DA),
                  fontSize: 13,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: _projects
                    .map(
                      (p) => _ProjectCard(title: p.$1, tech: p.$2, desc: p.$3),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title, tech, desc;
  const _ProjectCard({
    required this.title,
    required this.tech,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            tech,
            style: const TextStyle(color: Color(0xFF26C6DA), fontSize: 12),
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            style: const TextStyle(
              color: Color(0xFFB0BEC5),
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  static const _exp = [
    (
      'Senior Flutter Dev',
      'TechCorp Inc.',
      '2022 – Present',
      'Led mobile team building cross-platform apps used by 500k+ users.',
    ),
    (
      'Mobile Developer',
      'StartupXYZ',
      '2020 – 2022',
      'Built React Native apps from scratch with backend Node.js APIs.',
    ),
    (
      'Junior Developer',
      'Freelance',
      '2018 – 2020',
      'Developed small business apps and landing pages.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Experience',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Where I\'ve worked',
                style: TextStyle(
                  color: Color(0xFF26C6DA),
                  fontSize: 13,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: _exp
                    .map(
                      (e) => _TimelineItem(
                        role: e.$1,
                        company: e.$2,
                        period: e.$3,
                        desc: e.$4,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String role, company, period, desc;
  const _TimelineItem({
    required this.role,
    required this.company,
    required this.period,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Color(0xFF00BFA5),
                  shape: BoxShape.circle,
                ),
              ),
              Container(width: 2, height: 80, color: Colors.white10),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  role,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      company,
                      style: const TextStyle(
                        color: Color(0xFF26C6DA),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      period,
                      style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  desc,
                  style: const TextStyle(
                    color: Color(0xFFB0BEC5),
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Contact',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Get in touch',
                style: TextStyle(
                  color: Color(0xFF26C6DA),
                  fontSize: 13,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 32),
              _ContactItem(
                icon: Icons.mail_outline,
                label: 'hello@greatdev.io',
              ),
              const SizedBox(height: 14),
              _ContactItem(icon: Icons.code, label: 'github.com/greatdev'),
              const SizedBox(height: 14),
              _ContactItem(
                icon: Icons.work_outline,
                label: 'linkedin.com/in/greatdev',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ContactItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF00BFA5), size: 20),
          const SizedBox(width: 14),
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
