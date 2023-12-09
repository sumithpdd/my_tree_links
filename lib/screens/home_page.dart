import 'package:flutter/material.dart';

import '../enums/links.dart';
import '../feature/theme/widget/change_theme_button_widget.dart';
import '../models/dummy_user.dart';
import '../widgets/animated_link_button.dart';
import '../widgets/footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Tree Links"),
        actions: const [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height, // 100% of height
        width: MediaQuery.of(context).size.width, // 100% of width
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff9dc9e9), Color(0xff2059ff)],
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(dummyUser.profileImageUrl!)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dummyUser.name!, // Your Name
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                dummyUser.bio!, // Your short bio (optional)
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Container(
                      // height: 490,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: listLinks(),
                        ),
                      ),
                    ),
                  ),
                  const Footer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column listLinks() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        for (final s in (dummyUser.links ?? []))
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 10),
            child: AnimatedLinkButton(
              type: Link.values.byName((s['linkType'] as String).toLowerCase()),
              url: s['url'],
              linkText: (((s['linkType'] as String).toLowerCase() == "other")
                  ? s['text']
                  : ""),
            ),
          ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
      ],
    );
  }
}
