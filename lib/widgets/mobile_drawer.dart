import 'package:flutter/material.dart';
import 'header.dart'; // To use HeaderOption model

class MobileDrawer extends StatelessWidget {
  final List<HeaderOption> options;
  final Function(GlobalKey) onNavTap;

  const MobileDrawer({
    Key? key,
    required this.options,
    required this.onNavTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'MENU',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              IconButton(
                icon: const Icon(Icons.close, size: 20),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const SizedBox(height: 48),
          ...options.map((option) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                option.title,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
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
