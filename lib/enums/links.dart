import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Link types with its associated icon.
enum Link {
  twitter(
    icon: FontAwesomeIcons.twitter,
    text: "Twitter",
    containerColor: Colors.lightBlue,
    borderColor: Colors.lightBlue,
  ),
  linkedin(
    icon: FontAwesomeIcons.linkedin,
    text: "LinkedIn",
    containerColor: Colors.blueAccent,
    borderColor: Colors.blueAccent,
  ),
  github(
    icon: FontAwesomeIcons.github,
    text: "Github",
    containerColor: Colors.blueGrey,
    borderColor: Colors.blueGrey,
  ),
  website(
    icon: FontAwesomeIcons.globe,
    text: "Website",
    containerColor: Colors.lightBlueAccent,
    borderColor: Colors.lightBlueAccent,
  ),
  blog(
    icon: FontAwesomeIcons.blog,
    text: "Blog",
    containerColor: Color.fromARGB(255, 245, 176, 3),
    borderColor: Color.fromARGB(255, 245, 176, 3),
  ),
  companyWebsite(
    icon: FontAwesomeIcons.globe,
    text: "Company Website",
    containerColor: Colors.lightBlueAccent,
    borderColor: Colors.lightBlueAccent,
  ),
  youtube(
    icon: FontAwesomeIcons.youtube,
    text: "Youtube",
    containerColor: Colors.red,
    borderColor: Colors.red,
  ),
  other(
    icon: FontAwesomeIcons.link,
    text: "Other",
    containerColor: Colors.lightBlueAccent,
    borderColor: Colors.lightBlueAccent,
  );

  final IconData? icon;
  final Color? containerColor;
  final Color? borderColor;
  final String? text;
  const Link({this.icon, this.text, this.containerColor, this.borderColor});
}
