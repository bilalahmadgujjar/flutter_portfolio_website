import 'package:flutter/material.dart';
import 'package:portfolio_app/core/app_colors.dart';
import 'package:portfolio_app/widgets/text_widget.dart';
import 'header.dart'; // To use HeaderOption model

class MobileDrawer extends StatelessWidget {
  final List<HeaderOption> options;
  final Function(GlobalKey) onNavTap;
  final GlobalKey? selectedKey;

  const MobileDrawer({
    Key? key,
    required this.options,
    required this.onNavTap,
    required this.selectedKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundDarkPrimary,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text(text: 'MENU',
                textColor: accentMint,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),

              IconButton(
                icon: const Icon(Icons.close, size: 20),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const SizedBox(height: 40),
          ...options.map((option) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: text(
                text: option.title,
                textColor: option.key == selectedKey ? accentMint : textWhite,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              onTap: () {
                Navigator.of(context).pop();
                onNavTap(option.key);
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
