import 'package:flutter/material.dart';
import 'package:main/app/GUI/layouts/layout.menu.dart';
import 'package:main/app/GUI/layouts/layout.navigation.bottom.dart';
import 'package:main/app/GUI/pages/page.gallery.dart';
import 'package:main/app/GUI/pages/page.index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main/app/GUI/pages/page.upload.dart';

class AppEntryPoint extends ConsumerWidget {

  
  const AppEntryPoint({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final currentIndex = ref.watch(counterProvider);

    return Scaffold(
      appBar: const LayoutMenu(heightBar: 60),
      body: IndexedStack(
        index: currentIndex,
        children:  [PageIndex(), const PageGallery(), const PageUpload(),],
      ),
      bottomNavigationBar: Container(padding: const EdgeInsets.all(20), child: const LayoutNavigationBottom()),
    );
  } 

}
