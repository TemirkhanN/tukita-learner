import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeLinkButton extends StatelessWidget {
  final String caption;
  final String link;

  const YoutubeLinkButton(this.caption, this.link);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => _openUrl(link), child: Text("⏵ $caption"));
  }

  Future<void> _openUrl(String link) async {
    var url = Uri.parse(link);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
