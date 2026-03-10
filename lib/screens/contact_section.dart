import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/app_colors.dart';
import '../core/app_strings.dart';
import '../core/methods.dart';
import '../core/responsive.dart';
import '../widgets/text_widget.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final now = DateTime.now();

    // Month and weekday names
    final months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    final weekdays = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];

    final monthName = months[now.month - 1];
    final weekdayName = weekdays[now.weekday - 1];
    final dayNumber = now.day;

    return Container(
      width: double.infinity,
      color: backgroundDarkPrimary,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 120 : 24,
        vertical: 60,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header
              text(
                text: "GET IN TOUCH",
                fontSize: 24,
                fontWeight: FontWeight.w500,
                textColor: accentMint,
              ),
              const SizedBox(height: 12),
              text(
                text: "Let's build something together :)",
                fontSize: 14,
                fontWeight: FontWeight.w300,
                textColor: textWhite,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Main Row: Left = Date & Button, Right = Contact Info
              Flex(
                direction: isDesktop ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Column: Date & Book Session

                  Container(
                    margin: EdgeInsets.only(
                      right: isDesktop ? 60 : 0,
                      bottom: isDesktop ? 0 : 40,
                    ),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: backgroundDarkSecondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        text(
                          text: monthName.toUpperCase(),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          textColor: accentMint,
                        ),
                        const SizedBox(height: 8),
                        text(
                          text: dayNumber.toString(),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          textColor: textWhite,
                        ),
                        const SizedBox(height: 4),
                        text(
                          text: weekdayName,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          textColor: textDisabled,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: accentMint,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 14,
                            ),
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: const Text("Book a 45-min Session"),
                        ),
                      ],
                    ),
                  ),

                  // Right Column: Email, Phone, Divider, Social Icons
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      contactInfoContainer(
                        context: context,
                        leadingIcon: FontAwesomeIcons.solidEnvelope,
                        value: myEmail,
                        onTap: () => openUrl(myEmail),
                      ),
                      const SizedBox(height: 20),
                      contactInfoContainer(
                        context: context,
                        leadingIcon: FontAwesomeIcons.phone,
                        value: myPhone,
                        onTap: () => openUrl(myPhone),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: 210,
                        height: 1.5,
                        color: backgroundDarkSecondary,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          iconContainer(
                            context,
                            FontAwesomeIcons.instagram,
                            isDesktop,
                            () => openUrl(myInstagram),
                          ),
                          const SizedBox(width: 16),
                          iconContainer(
                            context,
                            FontAwesomeIcons.github,
                            isDesktop,
                            () => openUrl(myGithub),
                          ),
                          const SizedBox(width: 16),
                          iconContainer(
                            context,
                            FontAwesomeIcons.linkedin,
                            isDesktop,
                            () => openUrl(myLinkedIn),
                          ),
                          const SizedBox(width: 16),
                          iconContainer(
                            context,
                            FontAwesomeIcons.solidEnvelope,
                            isDesktop,
                            () => openUrl(myEmail),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 60),

              // Footer
              text(
                text: "Designed & Built in Flutter",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textColor: textDisabled,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///==================== Reusable Widgets ======================

  // Social icon
  Widget iconContainer(
    BuildContext context,
    IconData icon,
    bool isDesktop,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(isDesktop ? 16 : 12),
        decoration: BoxDecoration(
          color: backgroundDarkSecondary,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: FaIcon(icon, color: accentMint, size: isDesktop ? 20 : 16),
        ),
      ),
    );
  }

  // Contact info (phone/email) container
  Widget contactInfoContainer({
    required BuildContext context,
    required IconData leadingIcon,
    required String value,
    required VoidCallback onTap,
    double width = 300,
  }) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: backgroundDarkSecondary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          FaIcon(leadingIcon, color: accentMint, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: text(
                text: value.replaceAll(RegExp(r'^(tel:|mailto:)'), ''),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textColor: accentMint,
              ),
            ),
          ),
          const Icon(Icons.navigate_next_sharp, size: 25, color: accentMint),
        ],
      ),
    );
  }
}
