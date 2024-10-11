import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main/app/controllers/controller.view.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PageGallery extends ConsumerWidget {
  PageGallery({super.key});
  final indexManagerProvider = StateProvider<int>((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final data = ref.watch(dataProvider);
    final currentIndex = ref.watch(indexManagerProvider);

    return data.when(
      data: (data) {
        if(data.isEmpty){
          return const Center(child: Text("No data"));
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  child: ShadCard(
                    width: 500,
                    title: Text(data[currentIndex]['title']),
                    description: Text(data[currentIndex]['description']),
                  )),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                child: ShadCard(
                  width: 500,
                  child: CachedNetworkImage(
                    width: 300,
                    fit: BoxFit.cover,
                    imageUrl: data[currentIndex]['img'] as String,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  )
                ),
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
                        onPressed: () {
                          currentIndex > 0 ? ref.read(indexManagerProvider.notifier).state-- : null;
                        },
                      ),
                      ShadButton(
                        child: const Text('Next'),
                        onPressed: () async {
                          print("Has presionado, img: ${data[currentIndex]['img']}");
                          currentIndex < data.length - 1 ? ref.read(indexManagerProvider.notifier).state++ : null;
                        },
                      ),

                    ],
                ),
                )
              ),
            ],
          ));

      }, error: (Object error, StackTrace stackTrace) { 
        return const Center(child: Text("Error en los datos"));
      }, 
      loading: () { 
        return const Center(child: CircularProgressIndicator());
       }
    );
    
  }
}
