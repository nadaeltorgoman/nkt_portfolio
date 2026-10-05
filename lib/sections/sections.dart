import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme.dart';
import '../widgets/common.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(eyebrow: 'About', title: 'A bit about me'),
          Text(
            Profile.summary,
            style: t.titleMedium?.copyWith(color: AppColors.muted, height: 1.8),
          ),
          const SizedBox(height: 40),
          ResponsiveGrid(
            minItemWidth: 220,
            children: [
              for (final s in Profile.stats)
                HoverCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s.value,
                        style: t.displaySmall?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        s.label,
                        style: t.bodyLarge?.copyWith(color: AppColors.muted),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            eyebrow: 'Experience',
            title: 'Where I have worked',
          ),
          for (var i = 0; i < experiences.length; i++)
            _TimelineItem(
              exp: experiences[i],
              isLast: i == experiences.length - 1,
            ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({required this.exp, required this.isLast});
  final Experience exp;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    // Stack instead of IntrinsicHeight: the card sizes itself naturally and
    // the timeline line stretches to match, so wrapped text never overflows.
    return Stack(
      children: [
        if (!isLast)
          Positioned(
            left: 13,
            top: 40,
            bottom: 0,
            child: Container(width: 2, color: AppColors.border),
          ),
        Positioned(
          left: 7,
          top: 26,
          child: Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.bg,
              border: Border.all(color: AppColors.primary, width: 3),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 44),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: HoverCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 12,
                    runSpacing: 6,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: exp.role,
                              style: t.titleLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: '  @ ${exp.company}',
                              style: t.titleLarge?.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TagChip(exp.period),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.place_outlined,
                        size: 16,
                        color: AppColors.muted,
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          exp.location,
                          style: t.bodyMedium?.copyWith(color: AppColors.muted),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  for (final p in exp.points)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Icon(
                              Icons.arrow_right_rounded,
                              size: 18,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              p,
                              style: t.bodyLarge?.copyWith(
                                color: AppColors.muted,
                                height: 1.6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(eyebrow: 'Projects', title: 'Things I have built'),
          ResponsiveGrid(children: [for (final p in projects) _ProjectCard(p)]),
          const SizedBox(height: 28),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                'Also contributed to:',
                style: t.bodyLarge?.copyWith(color: AppColors.muted),
              ),
              for (final c in otherContributions) TagChip(c),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard(this.p);
  final Project p;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final (IconData linkIcon, String linkLabel) = switch (p.link?.type) {
      ProjectLinkType.play => (Icons.shop_rounded, 'Google Play'),
      ProjectLinkType.github => (Icons.code_rounded, 'GitHub'),
      ProjectLinkType.web => (Icons.language_rounded, 'Website'),
      null => (Icons.lock_outline_rounded, 'Private / Enterprise'),
    };

    return HoverCard(
      url: p.link?.url,
      child: SizedBox(
        height: 280,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.phone_iphone_rounded,
                    color: AppColors.primary,
                  ),
                ),
                const Spacer(),
                if (p.featured) ...[
                  const TagChip('Featured'),
                  const SizedBox(width: 8),
                ],
                Text(
                  p.period,
                  style: t.bodySmall?.copyWith(color: AppColors.muted),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              p.name,
              style: t.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 2),
            Text(
              p.category,
              style: t.bodyMedium?.copyWith(color: AppColors.primary),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                p.description,
                overflow: TextOverflow.fade,
                style: t.bodyMedium?.copyWith(
                  color: AppColors.muted,
                  height: 1.6,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [for (final tag in p.tags) TagChip(tag)],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Icon(linkIcon, size: 16, color: AppColors.muted),
                const SizedBox(width: 6),
                Text(
                  linkLabel,
                  style: t.bodySmall?.copyWith(color: AppColors.muted),
                ),
                if (p.link != null) ...[
                  const Spacer(),
                  const Icon(
                    Icons.north_east_rounded,
                    size: 16,
                    color: AppColors.primary,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(eyebrow: 'Skills', title: 'My toolbox'),
          ResponsiveGrid(
            minItemWidth: 480,
            children: [
              for (final g in skillGroups)
                HoverCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        g.title,
                        style: t.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final s in g.items) TagChip(s, large: true),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),
          HoverCard(
            child: Row(
              children: [
                const Icon(Icons.translate_rounded, color: AppColors.primary),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    'Arabic — Native  ·  English — Intermediate (B1–B2)',
                    style: t.bodyLarge,
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

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            eyebrow: 'Education',
            title: 'Education & training',
          ),
          ResponsiveGrid(
            minItemWidth: 480,
            children: [
              for (final e in education)
                HoverCard(
                  child: SizedBox(
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.school_outlined,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                e.title,
                                style: t.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Text(
                              e.period,
                              style: t.bodySmall?.copyWith(
                                color: AppColors.muted,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          e.place,
                          style: t.bodyMedium?.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: Text(
                            e.detail,
                            overflow: TextOverflow.fade,
                            style: t.bodyMedium?.copyWith(
                              color: AppColors.muted,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final contacts = [
      (Icons.email_outlined, 'Email', Links.email, 'mailto:${Links.email}'),
      (
        Icons.work_outline_rounded,
        'LinkedIn',
        'in/nada-eltorgoman',
        Links.linkedin,
      ),
      (Icons.code_rounded, 'GitHub', 'Nada Eltorgoman', Links.github),
      (Icons.chat_outlined, 'WhatsApp', Links.phoneDisplay, Links.whatsapp),
      (Icons.phone_outlined, 'Phone', Links.phoneDisplay, 'tel:${Links.phone}'),
    ];

    return SectionContainer(
      child: Container(
        padding: EdgeInsets.all(context.isMobile ? 24 : 48),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary.withValues(alpha: 0.12),
              AppColors.accent.withValues(alpha: 0.12),
            ],
          ),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            Text(
              'CONTACT',
              style: t.labelLarge?.copyWith(
                color: AppColors.primary,
                letterSpacing: 2,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Let's build something together",
              textAlign: TextAlign.center,
              style: (context.isMobile ? t.headlineMedium : t.displaySmall)
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            Text(
              "I'm open to Flutter roles and freelance projects. Reach out on any of these:",
              textAlign: TextAlign.center,
              style: t.titleMedium?.copyWith(color: AppColors.muted),
            ),
            const SizedBox(height: 32),
            ResponsiveGrid(
              minItemWidth: 240,
              spacing: 14,
              children: [
                for (final (icon, label, value, url) in contacts)
                  HoverCard(
                    padding: 18,
                    url: url,
                    child: Row(
                      children: [
                        Icon(icon, color: AppColors.primary),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                label,
                                style: t.bodySmall?.copyWith(
                                  color: AppColors.muted,
                                ),
                              ),
                              Text(
                                value,
                                overflow: TextOverflow.ellipsis,
                                style: t.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
      child: Text(
        '© ${DateTime.now().year} ${Profile.name} · Built with Flutter Web 💙',
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppColors.muted, fontSize: 13),
      ),
    );
  }
}
