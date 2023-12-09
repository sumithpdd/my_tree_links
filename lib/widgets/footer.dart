import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  String url = 'https://github.com/sumithpdd';
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Open the link when the container is clicked
      onTap: () {
        _launchUrl(Uri.parse(url));
      },
      onHover: (value) {
        // Handle hover state
        setState(() {
          isHovered = value;
        });
      },
      child: Container(
        // color: Colors.black,
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIcon(Icons.devices, isHovered),
            const SizedBox(width: 5),
            const Text(
              'Made with',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 5),
            _buildIcon(Icons.flutter_dash, isHovered),
            const SizedBox(width: 5),
            const Text(
              'Flutter by Sumith Damodaran',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, bool isHovered) {
    return Icon(
      icon,
      // Change the color based on hover state
      color: isHovered ? Colors.amber : Colors.white,
    );
  }

  void _launchUrl(Uri url) async {
    if (await url_launcher.canLaunchUrl(Uri.parse(url.toString()))) {
      await url_launcher.launchUrl(Uri.parse(url.toString()));
    } else {
      throw 'Could not launch $url';
    }
  }
}
