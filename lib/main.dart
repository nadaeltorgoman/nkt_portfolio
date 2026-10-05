import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'data/portfolio_data.dart';
import 'sections/hero.dart';
import 'sections/sections.dart';
import 'theme.dart';
import 'widgets/common.dart';

void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${Profile.name} — ${Profile.title}',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      // Lets visitors select and copy any text on the page.
      home: const SelectionArea(child: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scroll = ScrollController();
  final _keys = {
    'About': GlobalKey(),
    'Experience': GlobalKey(),
    'Projects': GlobalKey(),
    'Skills': GlobalKey(),
    'Education': GlobalKey(),
    'Contact': GlobalKey(),
  };
  bool _scrolled = false;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      final s = _scroll.offset > 20;
      if (s != _scrolled) setState(() => _scrolled = s);
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  void _goTo(String section) {
    final ctx = _keys[section]?.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: context.isMobile ? _MobileDrawer(sections: _keys.keys, onTap: _goTo) : null,
      body: Stack(
        children: [
          Positioned(
            top: -200,
            left: -150,
            child: _Glow(color: AppColors.primary.withValues(alpha: 0.12)),
          ),
          Positioned(
            top: 500,
            right: -200,
            child: _Glow(color: AppColors.accent.withValues(alpha: 0.10)),
          ),
          SingleChildScrollView(
            controller: _scroll,
            child: Column(
              children: [
                const SizedBox(height: 72),
                HeroSection(
                  onContact: () => _goTo('Contact'),
                  onProjects: () => _goTo('Projects'),
                ),
                AboutSection(key: _keys['About']),
                ExperienceSection(key: _keys['Experience']),
                ProjectsSection(key: _keys['Projects']),
                SkillsSection(key: _keys['Skills']),
                EducationSection(key: _keys['Education']),
                ContactSection(key: _keys['Contact']),
                const Footer(),
              ],
            ),
          ),
          _NavBar(
            scrolled: _scrolled,
            sections: _keys.keys,
            onTap: _goTo,
            onLogo: () => _scroll.animateTo(0,
                duration: const Duration(milliseconds: 700), curve: Curves.easeInOutCubic),
          ),
        ],
      ),
    );
  }
}

class _Glow extends StatelessWidget {
  const _Glow({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: 600,
        height: 600,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(colors: [color, Colors.transparent]),
        ),
      ),
    );
  }
}

class _NavBar extends StatelessWidget {
  const _NavBar({
    required this.scrolled,
    required this.sections,
    required this.onTap,
    required this.onLogo,
  });
  final bool scrolled;
  final Iterable<String> sections;
  final ValueChanged<String> onTap;
  final VoidCallback onLogo;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 72,
      padding: EdgeInsets.symmetric(horizontal: context.gutter),
      decoration: BoxDecoration(
        color: scrolled ? AppColors.bg.withValues(alpha: 0.92) : Colors.transparent,
        border: Border(
          bottom: BorderSide(color: scrolled ? AppColors.border : Colors.transparent),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Row(
            children: [
              InkWell(
                onTap: onLogo,
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/nkt-logo.svg', height: 28),
                      const SizedBox(width: 10),
                      Text('Nada.dev',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w800)),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              if (context.isMobile)
                Builder(
                  builder: (ctx) => IconButton(
                    icon: const Icon(Icons.menu_rounded),
                    onPressed: () => Scaffold.of(ctx).openEndDrawer(),
                  ),
                )
              else ...[
                for (final s in sections)
                  TextButton(
                    onPressed: () => onTap(s),
                    style: TextButton.styleFrom(foregroundColor: AppColors.muted),
                    child: Text(s),
                  ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: () => openUrl(Links.cv),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.bg,
                  ),
                  child: const Text('Resume'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _MobileDrawer extends StatelessWidget {
  const _MobileDrawer({required this.sections, required this.onTap});
  final Iterable<String> sections;
  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            for (final s in sections)
              ListTile(
                title: Text(s),
                onTap: () {
                  Navigator.pop(context);
                  Future.delayed(const Duration(milliseconds: 250), () => onTap(s));
                },
              ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.download_rounded),
              title: const Text('Download CV'),
              onTap: () => openUrl(Links.cv),
            ),
          ],
        ),
      ),
    );
  }
}
