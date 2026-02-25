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

  const HeaderBox({
    Key? key,
    required this.options,
    required this.onNavTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Container(
      color: backgroundDarkSecondary,
      padding:  isDesktop?EdgeInsets.symmetric(horizontal: 180, vertical: 16): EdgeInsets.symmetric(horizontal: 30, vertical: 16),
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
            )
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
}
