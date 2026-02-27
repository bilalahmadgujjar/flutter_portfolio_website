import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../core/responsive.dart';
import '../core/theme.dart';
import '../widgets/text_widget.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: backgroundDarkSecondary,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'SKILLS & EXPERTISE',
                style: theme.headlineLarge!.copyWith(
                  color: accentMint,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 30),
              Responsive(
                mobile: _buildContent(context, false),
                desktop: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: _buildContent(context, true)),
                    const SizedBox(width: 64),
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SvgPicture.asset(
                          'assets/image/stack.svg',
                          fit: BoxFit.cover,
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
    );
  }

  Widget _buildContent(BuildContext context, bool isDesktop) {
    return Column(
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        text(
          text:
              "I embrace change by constantly exploring emerging technologies, mastering them efficiently, and transforming my learning into real-world projects to measure growth and refine my expertise.",
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
          fontSize: 13,
          fontWeight: FontWeight.w300,
          textColor: textWhite,
        ),
        const SizedBox(height: 32),

        text(text: 'Mobile development', textColor: textDisabled),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            skillContainer('assets/skills/flutter.svg', 'Flutter'),
            SizedBox(width: 14),
            skillContainer('assets/skills/dart.svg', 'Dart'),
          ],
        ),

        const SizedBox(height: 20),

        text(text: 'Server side', textColor: textDisabled),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            skillContainer('assets/skills/api.svg', 'REST APIs'),
            SizedBox(width: 14),
            skillContainer('assets/skills/dart.svg', 'Dart'),
          ],
        ),

        const SizedBox(height: 20),

        text(text: 'Database', textColor: textDisabled),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            skillContainer('assets/skills/firebase.svg', 'Firebase'),
            SizedBox(width: 14),
            skillContainer('assets/skills/sql.svg', 'Postgres SQL'),
          ],
        ),

        const SizedBox(height: 20),

        text(text: 'Version controlling & management', textColor: textDisabled),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            skillContainer('assets/skills/github.svg', 'GitHub'),
          ],
        ),

        const SizedBox(height: 20),

        text(text: 'UI/UX Design', textColor: textDisabled),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            skillContainer('assets/skills/figma.svg', 'Figma'),
            SizedBox(width: 14),
            skillContainer('assets/skills/adobexd.svg', 'Adobe XD'),
          ],
        ),

        const SizedBox(height: 30),
        if (!isDesktop)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SvgPicture.asset(
              'assets/image/stack.svg',
              fit: BoxFit.cover,
            ),
          ),
      ],
    );
  }

  Container skillContainer(String svgPath, String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: accentMint,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(svgPath, height: 22),
          const SizedBox(width: 8),
          text(
            text: title,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            textColor: backgroundDarkPrimary,
          ),
        ],
      ),
    );
  }
}
