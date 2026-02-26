

import 'package:flutter/material.dart';
import 'package:portfolio_app/core/theme.dart';
import 'package:portfolio_app/widgets/text_widget.dart';
import '../core/responsive.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  final List<String> titles = [
    "Flutter Developer",
    "Educator",
    "Book Lover",
    "A Listener",
  ];

  int index = 0;

  @override
  void initState() {
    super.initState();

    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 2));
      if (!mounted) return false;

      setState(() {
        index = (index + 1) % titles.length;
      });

      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final theme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight:
        MediaQuery.of(context).size.height -
            80, // rough height minus header
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: isDesktop?MainAxisAlignment.center:MainAxisAlignment.start,
                  crossAxisAlignment: isDesktop
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    isMobile || isTablet?CircleAvatar(
                      radius: 75, // half of width/height
                      backgroundColor: backgroundDarkPrimary.withValues(alpha: 0.6),
                      backgroundImage: AssetImage('assets/image/profile.png'),
                    ):SizedBox(),
                    isMobile || isTablet?SizedBox(height: 22,):SizedBox(),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Software Engineer'),
                    ),
                    SizedBox(height: 16),
                    text(
                      text: 'Muhammad',
                      letterSpace: 5,
                      fontWeight: FontWeight.w100,
                      textColor: textWhite,
                      fontSize: isDesktop ? 55 : 40,
                      textAlign: isDesktop
                          ? TextAlign.left
                          : TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Bilal Ahmad",
                      style: isDesktop
                          ? theme.displayLarge!.copyWith(fontSize: 50)
                          : theme.displayMedium!.copyWith(fontSize: 30),
                      textAlign: isDesktop
                          ? TextAlign.left
                          : TextAlign.center,
                    ),
                    const SizedBox(height: 22),

                    Row(
                      mainAxisAlignment: isDesktop
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.center,
                      children: [
                        Icon(Icons.play_arrow, color: accentMint),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          child: text(
                            nameKey: ValueKey(index),
                            text: titles[index],
                            fontWeight: FontWeight.w200,
                            textColor: textWhite,
                            fontSize: 14,
                            textAlign: isDesktop
                                ? TextAlign.left
                                : TextAlign.center,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    /// Social Icons
                    Row(
                      mainAxisAlignment: isDesktop
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.center,
                      children: [
                        isDesktop
                            ? Container(
                          width: 80,
                          height: 0.5,
                          color: textWhite,
                        )
                            : SizedBox.shrink(),
                        isDesktop ? SizedBox(width: 20) : SizedBox.shrink(),
                        Row(
                          mainAxisAlignment: isDesktop
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.center,
                          children: [
                            iconContainer(
                              context,
                              Icons.facebook,
                              isDesktop,
                            ),
                            SizedBox(width: 4),
                            iconContainer(context, Icons.email, isDesktop),
                            SizedBox(width: 4),
                            iconContainer(context, Icons.code, isDesktop),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    text(
                      text: "LET'S CHAT!",
                      letterSpace: 2,
                      fontWeight: FontWeight.w500,
                      textColor: accentMint,
                      fontSize: 14,
                    ),
                    const SizedBox(height: 5),
                    Container(width: 110, height: 1.5, color: accentMint),
                    const SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: isDesktop
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.center,
                      children: [
                        expRow(context, '~2', 'Years\nExperience',isDesktop),
                        SizedBox(width: 15),
                        expRow(
                            context,
                            '20+',
                            'Projects Completed\nin Pakistan',isDesktop
                        ),
                        SizedBox(width: 15),
                        expRow(context, '~130k', 'Content\nReach & Views',isDesktop),
                      ],
                    ),
                  ],
                ),
              ),
              isDesktop? SizedBox(width: 100,):SizedBox.shrink(),
              isDesktop? Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Full circular background
                    Container(
                      width: isDesktop?MediaQuery.of(context).size.width * 0.35: MediaQuery.of(context).size.width * 0.40,
                      height: isDesktop?MediaQuery.of(context).size.width * 0.35:MediaQuery.of(context).size.width * 0.40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: backgroundDarkPrimary.withValues(alpha: 0.6),
                      ),
                    ),

                    // CircleAvatar image on top
                    CircleAvatar(
                      radius: isTablet? (MediaQuery.of(context).size.width * 0.45) / 2: (MediaQuery.of(context).size.width * 0.28) / 2,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/image/profile.png'),
                    ),


                  ],
                ),
              ):SizedBox(),


            ],
          ),
        ),
      ),
    );
  }

  ///======================================
  ///=========== Reusable Widgets ========
  ///====================================

  Row expRow(BuildContext context, String title, String body,bool isDesktop) {
    return Row(
      children: [
        text(
          text: title,
          fontSize: isDesktop? 24:16,
          fontWeight: FontWeight.w400,
          textColor: textWhite,
        ),
        SizedBox(width: 5),
        text(
          text: body,
          fontSize: isDesktop? 10:6,
          fontWeight: FontWeight.w400,
          textColor: textDisabled,
        ),
      ],
    );
  }

  Container iconContainer(BuildContext context, IconData icon, bool isDesktop) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundDarkPrimary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(icon, color: accentMint, size: isDesktop ? 20 : 20),
      ),
    );
  }
}