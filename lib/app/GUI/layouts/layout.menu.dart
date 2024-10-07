import 'package:flutter/material.dart';

class LayoutMenu extends StatelessWidget implements PreferredSizeWidget {

  final double heightBar;
  const LayoutMenu({super.key, required this.heightBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
            padding: const EdgeInsets.only(left: 16),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.info),
              tooltip: 'Info',
            )),
        Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.bug_report),
              tooltip: 'report bug',
            )),
        Padding(
            padding: const EdgeInsets.only(left: 10, right: 16),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
              tooltip: 'settings',
            ))
      ],
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(heightBar);
}
