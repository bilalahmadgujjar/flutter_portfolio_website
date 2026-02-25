import 'package:flutter/material.dart';
import '../core/responsive.dart';
import '../core/theme.dart';

class HeaderOption {
  final String title;
  final GlobalKey key;

  HeaderOption({required this.title, required this.key});
}

class HeaderBox extends StatelessWidget {
  final List<HeaderOption> options;
  final Function(GlobalKey) onNavTap;

  const HeaderBox({super.key, required this.options, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Container(
      color: backgroundDarkSecondary,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding(context),
        vertical: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Bilal',
            style: TextStyle(
              color: textWhite,
              fontFamily: 'Agustina',
              fontWeight: FontWeight.w400,
              fontSize: 22,
              letterSpacing: 2,
            ),
          ),
          if (isDesktop)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: options.map((option) {
                return Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: InkWell(
                    onTap: () => onNavTap(option.key),
                    child: Text(
                      option.title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: textDisabled,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.5,
                      ),
                    ),
                  ),
                );
              }).toList(),
            )
          else
            IconButton(
              icon: const Icon(Icons.menu, size: 32),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
        ],
      ),
    );
  }

  double horizontalPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > 1400) {
      return 180; // Large screens
    } else if (width > 1100) {
      return 100; // Laptops
    } else if (width > 800) {
      return 60; // Tablets / small screens
    } else {
      return 24; // Mobile
    }
  }
}
