import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/portfolio_data.dart';
import '../theme.dart';
import '../widgets/common.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onContact, required this.onProjects});
  final VoidCallback onContact;
  final VoidCallback onProjects;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final mobile = context.isMobile;

    final intro = Column(
      crossAxisAlignment: mobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: Colors.green.withValues(alpha: 0.35)),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.circle, size: 8, color: Colors.greenAccent),
              SizedBox(width: 8),
              Text('Open to opportunities',
                  style: TextStyle(color: Colors.greenAccent, fontSize: 13)),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "Hi, I'm",
          style: t.titleLarge?.copyWith(color: AppColors.muted),
        ),
        const SizedBox(height: 4),
        ShaderMask(
          shaderCallback: (r) => const LinearGradient(
            colors: [AppColors.primary, AppColors.accent],
          ).createShader(r),
          child: Text(
            Profile.name,
            textAlign: mobile ? TextAlign.center : TextAlign.start,
            // Keep the last line's full descent inside the text box so the
            // gradient also covers the tails of letters like "g".
            textHeightBehavior: const TextHeightBehavior(
              applyHeightToLastDescent: false,
            ),
            style: (mobile ? t.displaySmall : t.displayLarge)?.copyWith(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.1,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '${Profile.title} · ${Profile.location}',
          style: t.headlineSmall?.copyWith(color: AppColors.text, fontWeight: FontWeight.w500),
          textAlign: mobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(
            Profile.tagline,
            textAlign: mobile ? TextAlign.center : TextAlign.start,
            style: t.titleMedium?.copyWith(color: AppColors.muted, height: 1.6),
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: mobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            PrimaryButton(label: 'View my work', icon: Icons.apps_rounded, onPressed: onProjects),
            PrimaryButton(
              label: 'Download CV',
              icon: Icons.download_rounded,
              outlined: true,
              onPressed: () => openUrl(Links.cv),
            ),
            PrimaryButton(
              label: 'Contact me',
              icon: Icons.mail_outline_rounded,
              outlined: true,
              onPressed: onContact,
            ),
          ],
        ),
      ],
    );

    final avatar = Container(
      width: mobile ? 180 : 300,
      height: mobile ? 180 : 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.accent],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.35),
            blurRadius: 80,
            spreadRadius: 4,
          ),
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.bg),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/images/nkt-logo.svg', height: 72),
            const SizedBox(height: 12),
            Text('NKT',
                style: (mobile ? t.headlineMedium : t.displaySmall)
                    ?.copyWith(fontWeight: FontWeight.w800, letterSpacing: 4)),
          ],
        ),
      ),
    );

    return SectionContainer(
      vertical: 120,
      child: FadeIn(
        child: mobile
            ? Column(children: [avatar, const SizedBox(height: 40), intro])
            : Row(
                children: [
                  Expanded(flex: 3, child: intro),
                  const SizedBox(width: 40),
                  Expanded(flex: 2, child: Center(child: avatar)),
                ],
              ),
      ),
    );
  }
}
