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
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: isDesktop
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
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
                fontSize: 55,
                textAlign: isDesktop ? TextAlign.left : TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                "Bilal Ahmad",
                style: isDesktop ? theme.displayLarge : theme.displayMedium,
                textAlign: isDesktop ? TextAlign.left : TextAlign.center,
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
                      textAlign: isDesktop ? TextAlign.left : TextAlign.center,
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
                      ? Container(width: 80, height: 0.5, color: textWhite)
                      : SizedBox.shrink(),
                  isDesktop ? SizedBox(width: 20) : SizedBox.shrink(),
                  Row(
                    mainAxisAlignment: isDesktop
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      iconContainer(context, Icons.facebook, isDesktop),
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
                  expRow(context, '~2', 'Years\nExperience'),
                  SizedBox(width: 15),
                  expRow(context, '20+', 'Projects Completed\nin Pakistan'),
                  SizedBox(width: 15),
                  expRow(context, '~130k', 'Content\nReach & Views'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///======================================
  ///=========== Reusable Widgets ========
  ///====================================

  Row expRow(BuildContext context, String title, String body) {
    return Row(
      children: [
        text(
          text: title,
          fontSize: 24,
          fontWeight: FontWeight.w400,
          textColor: textWhite,
        ),
        SizedBox(width: 5),
        text(
          text: body,
          fontSize: 10,
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
