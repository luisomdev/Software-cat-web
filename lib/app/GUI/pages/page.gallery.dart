import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PageGallery extends StatelessWidget {
  const PageGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    child: Column(
      children: [
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: const ShadCard(
              width: 500,
              title: Text('{Name cat random}'),
              description: Text('Description cat random'),
            )),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: ShadCard(
            width: 500,
            child: SvgPicture.asset('assets/img/imagen2.svg', width: 400,),
          ),
        ),

        Container(
          padding: const EdgeInsets.all(20),
          child: ShadCard(
            width: 500,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShadButton.outline(
                  child: const Icon(Icons.play_circle,),
                  onPressed: () {},
                ),
                ShadTooltip(
                  builder: (context) => const Text('2:30'),
                  child: const ShadSlider(
                  
                    initialValue: 33,
                    max: 100),

                ),
                const Text('2:30'),

              ]
            ),
          )
        ), 
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: ShadCard(
            width: 500,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShadButton(
                  child: const Text('Back'),
                  onPressed: () {},
                ),
                              ShadButton(
                  child: const Text('Random'),
                  onPressed: () {},
                ),

                ShadButton(
                  child: const Text('Next'),
                  onPressed: () {},
                ),

              ],
          ),
          )
        ),
      ],
    ));
  }
}
