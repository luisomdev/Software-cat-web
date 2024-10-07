import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PageUpload extends StatelessWidget {
  
  const PageUpload({super.key});  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    child: Column(
      children: [

        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: ShadCard(
            title: const Text("You files upload"),
            width: 500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShadButton(
                  onPressed: () {}, child: const Text("Upload image")),
                ShadButton(
                  onPressed: () {}, child: const Text("Upload audio")),
              ],
            ),
          )),

          Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: ShadCard(
            title: const Text("Form upload cat"),
            width: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                const Text("Title cat", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                const ShadInput(placeholder: Text("You title cat")),
                const SizedBox(height: 10),
                const Text("Description cat", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                const ShadInput(placeholder: Text("Here description cat")),
                const SizedBox(height: 20),
                ShadButton(
                  onPressed: () {}, child: const Text("Upload form"))

              ],
            ),
          ))

      ],
    ));
  }

}

