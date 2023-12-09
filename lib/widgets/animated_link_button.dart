import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_tree_links/widgets/qrcode_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../enums/links.dart';

class AnimatedLinkButton extends StatefulWidget {
  final Link type;
  final String url;
  final String linkText;

  const AnimatedLinkButton({
    required this.type,
    required this.url,
    required this.linkText,
    super.key,
  });

  @override
  State<AnimatedLinkButton> createState() => _AnimatedLinkButtonState();
}

class _AnimatedLinkButtonState extends State<AnimatedLinkButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // constrains of min height and width
      constraints: const BoxConstraints(
        minHeight: 50,
        minWidth: 250,
      ),
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          height: MediaQuery.of(context).size.height * 0.063,
          decoration: BoxDecoration(
            color: widget.type.containerColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: _isHovered ? widget.type.borderColor! : Colors.white,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _isHovered
                          ? Colors.white
                          : IconTheme.of(context).color,
                    ),
                    child: Center(
                      child: FaIcon(
                        widget.type.icon,
                        color: widget.type.containerColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  widget.linkText.isEmpty ? widget.type.text! : widget.linkText,
                  style: TextStyle(
                    color:
                        _isHovered ? Colors.white : IconTheme.of(context).color,
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.touch_app_outlined,
                      key: ValueKey<bool>(_isHovered),
                      color: _isHovered
                          ? Colors.white
                          : IconTheme.of(context).color),
                  onPressed: () async {
                    // Open the link when the container is clicked
                    launchUrlString(widget.url,
                        mode: LaunchMode.externalApplication);
                  }),
              IconButton(
                icon: Icon(FontAwesomeIcons.copy,
                    color: _isHovered
                        ? Colors.white
                        : IconTheme.of(context).color),
                onPressed: () async {
                  FlutterClipboard.copy(widget.url).then(
                    (value) {
                      return ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Text Copied'),
                        ),
                      );
                    },
                  );
                },
              ),
              IconButton(
                  icon: Icon(FontAwesomeIcons.qrcode,
                      color: _isHovered
                          ? Colors.white
                          : IconTheme.of(context).color),
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return QrCodeWidget(
                          code: widget.url,
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
