import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String? url) async {
  if (url == null || url.trim().isEmpty) return;

  try {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      debugPrint("Cannot launch url: $url");
    }
  } catch (e) {
    debugPrint("URL Launch Error: $e");
  }
}