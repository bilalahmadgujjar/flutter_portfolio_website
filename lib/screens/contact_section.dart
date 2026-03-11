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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
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
              const SizedBox(height: 50),

              // Main Flex: Adjust order for mobile
              Flex(
                direction: isDesktop ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: isDesktop
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  // Left Column: Date + Book Button
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: isDesktop
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.center,
                    children: [

                      // Date Box - Compact UI
                      Container(
                        width: 240, // smaller width
                        decoration: BoxDecoration(
                          color: backgroundDarkSecondary,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Month Header
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 12), // smaller vertical padding
                              decoration: BoxDecoration(
                                color: accentMint,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              ),
                              child: Center(
                                child: text(
                                  text: monthName.toUpperCase(),
                                  fontSize: 20, // smaller font
                                  fontWeight: FontWeight.bold,
                                  textColor: backgroundDarkPrimary,
                                ),
                              ),
                            ),

                            const SizedBox(height: 8), // smaller spacing

                            // Day and Weekday
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 16,
                              ),
                              child: Column(
                                children: [
                                  // Day Number
                                  text(
                                    text: dayNumber.toString(),
                                    fontSize: 35, // smaller font
                                    fontWeight: FontWeight.bold,
                                    textColor: textWhite,

                                  ),
                                  const SizedBox(height: 12),
                                  // Weekday
                                  text(
                                    text: weekdayName,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    textColor: textWhite.withValues(alpha: 0.7),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Book Session Button (Always under date, centered)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: accentMint,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.video_camera_back, size: 20),
                            const SizedBox(width: 10),
                            text(
                              text: 'Book a 45 mins session',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Spacer between left and right column on desktop
                  if (isDesktop)
                    const SizedBox(width: 70)
                  else
                    const SizedBox(height: 40),

                  // Right Column: Contact Info + Socials
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
                            FontAwesomeIcons.whatsapp,
                            isDesktop,
                                () => openUrl(myWhatsapp),
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
             isDesktop
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text(
                    text: "Designed & Built in Flutter by",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textColor: textWhite,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(width: 10),
                  text(
                    text: "Muhammad Bilal Ahmad",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textColor: accentMint,
                    textAlign: TextAlign.center,
                  ),
                ],
              )
                  : Column(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text(
                    text: "Designed & Built in Flutter by",
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    textColor: textWhite,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  text(
                    text: "Muhammad Bilal Ahmad",
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    textColor: accentMint,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///==================== Reusable Widgets ======================

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
