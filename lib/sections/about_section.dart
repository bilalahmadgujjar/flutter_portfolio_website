import 'package:flutter/material.dart';
import 'package:portfolio_app/core/theme.dart';
import 'package:portfolio_app/widgets/text_widget.dart';
import '../core/responsive.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final theme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      color: backgroundDarkPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ABOUT ME',
                style: theme.headlineLarge!.copyWith(
                  color: accentMint,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 30),

              Responsive(
                mobile: _buildContent(context, false),
                desktop: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Expanded(
                        flex: 1,
                        child:
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/image/about.jpeg',
                            fit: BoxFit.cover,
                          ),
                        )

                    ),
                    const SizedBox(width: 64),
                    Expanded(flex: 2, child: _buildContent(context, true)),

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
        const SizedBox(height: 22),

        text(
          text: "Hello! I'm Bilal ",
          letterSpace: 2,
          fontWeight: FontWeight.w100,
          textColor: textWhite,
          fontSize: isDesktop ? 55 : 40,
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
        ),
        const SizedBox(height: 22),
        text(
          text: "A Flutter Mobile Application Developer",
          fontWeight: FontWeight.w500,
          textColor: accentMint,
          fontSize: 14,
          textAlign: TextAlign.justify,
        ),

        const SizedBox(height: 22),

        text(
          text:
              "Turning ideas into elegant, high-performance mobile experiences.",
          textColor: textDisabled,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          textAlign: isDesktop? TextAlign.justify:TextAlign.center,
        ),
        const SizedBox(height: 30),
        text(
          text:
              "I’m a passionate Flutter Developer focused on building clean, responsive, and user-centric applications. I specialize in developing cross-platform solutions using Flutter, creating seamless experiences across Android and iOS App's. I enjoy transforming ideas into intuitive, high-quality interfaces while ensuring performance, scalability, and maintainable architecture. My approach combines thoughtful UI design with solid engineering practices to deliver reliable and engaging products. I’m continuously learning, exploring new technologies, and improving my craft to stay aligned with modern development standards and build better digital experiences.",
          textAlign: TextAlign.justify,
          fontSize: 14,
          height: 2,
          fontWeight: FontWeight.w400,
          textColor: textWhite,
        ),
        const SizedBox(height: 32),
          ElevatedButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                ),
              ),
              onPressed: (){}, child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.description,size: 18,),
              SizedBox(width: 10,),
              text(text: 'Download Resume',fontWeight: FontWeight.w500,fontSize: 13),

            ],
          )),
        const SizedBox(height: 32),
        if (!isDesktop)   ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            width: 400,
            'assets/image/about.jpeg',
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
