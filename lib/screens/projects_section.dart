import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_app/core/app_colors.dart';
import '../core/app_strings.dart';
import '../core/responsive.dart';
import '../widgets/text_widget.dart';

class ProjectItem {
  final String title;
  final String description;
  final List<String> tags;
  final String link;

  ProjectItem({
    required this.title,
    required this.description,
    required this.tags,
    required this.link,
  });
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final isMobile = Responsive.isMobile(context);
    final isTab = Responsive.isTablet(context);



    final crossAxisCount = isMobile ? 1 : isTab ? 2 : 3;
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
                'PROJECTS',
                style: theme.headlineLarge!.copyWith(
                  color: accentMint,
                  fontSize: 24,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              const SizedBox(height: 15),
              text(
                text:
                'Stuff I loved working with',
                textAlign:  TextAlign.center,
                fontSize: 13,
                fontWeight: FontWeight.w300,
                textColor: textWhite,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 40),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 32,
                  childAspectRatio: isMobile ? 1.18 : isTab ? 1.17 : 1.01,
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return _buildProjectCard(context, projects[index]);
                },
              ),
              // const SizedBox(height: 48),
              // OutlinedButton(
              //   onPressed: () {},
              //   child: const Text('View All Projects'),
              // ),
            ],
          ),
        ),
      ),
    );
  }



  ///===============================================================
  ///=========================== Widgets ===========================
  ///===============================================================

  Widget _buildProjectCard(BuildContext context, ProjectItem project) {
    final theme = Theme.of(context).textTheme;
    final isMobile = Responsive.isMobile(context);
    final isTab = Responsive.isTablet(context);

    return Container(
      decoration: BoxDecoration(
        color: backgroundDarkSecondary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// IMAGE
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
            child: AspectRatio(
              aspectRatio: isMobile?16 / 8:isTab? 16 / 8 :16 / 9,

              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP77I3VISSKS8X16c8dtDA1ynJ9xMPGHa1jg&s',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),

          /// CONTENT
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// TITLE
                  Text(
                    project.title,
                    style: theme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 18 : 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// DESCRIPTION
                  // text(
                  //   text:
                  //   project.description,
                  //   textAlign: TextAlign.justify,
                  //   fontSize: 12,
                  //   maxLines: 2,
                  //   overflow: TextOverflow.ellipsis,
                  //   fontWeight: FontWeight.w400,
                  //   textColor: textDisabled,
                  // ),
                  //
                  // const Spacer(),

                  /// TAGS

                  SizedBox(
                    height: 30,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: project.tags.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 6),
                      itemBuilder: (context, index) {
                        final tag = project.tags[index];

                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: backgroundDarkPrimary,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: text(
                              text: tag,
                              textColor: accentMint,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 14),

                  /// STORE ICONS

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _storeButton(
                        icon: FontAwesomeIcons.apple,
                        label: "App",
                        iconSize: 15,
                      ),
                      _storeButton(
                        icon: FontAwesomeIcons.google,
                        label: "Play",
                        iconSize: 12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  /// STORE BUTTON
  Widget _storeButton({
    required IconData icon,
    required String label,
    required double iconSize,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundDarkPrimary,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: iconSize, color: accentMint),
          const SizedBox(width: 6),
          text(text: label, textColor: accentMint),
        ],
      ),
    );
  }





}