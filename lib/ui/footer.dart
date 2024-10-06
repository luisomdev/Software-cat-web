import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Row(
              children: [
                Text("Made with ", style: TextStyle(color: Colors.white, fontSize: 20)),
                Icon(Icons.favorite, color: Colors.red, size: 20),
              ],
            ),
          ),
          Container()
        ],
      )
    );
  }
}