import 'package:flutter/material.dart';
import 'package:main/app/controllers/controller.gallery.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageUpload extends ConsumerWidget {
  
  const PageUpload({super.key});  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final formState = ref.watch(formProvider); // Escucha los cambios en el estado del formulario

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
                  onPressed: () async {
                    await ref.read(formProvider.notifier).uploadImage();
                  },

                  child: const Text("Upload image"),                 
                ),
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
                ShadInput(placeholder: const Text("You title cat"),
                  initialValue: formState['title'],
                  onChanged: (value) async{
                    await ref.read(formProvider.notifier).addTitle(value);
                  },
                ),
                const SizedBox(height: 10),
                const Text("Description cat", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                ShadInput(placeholder: const Text("Here description cat"),
                  initialValue: formState['description'], 
                  onChanged: (value) async {
                    await ref.read(formProvider.notifier).addDescription(value);
                  },
                ),
                const SizedBox(height: 20),
                ShadButton(
                  onPressed: () async {
                    ShadToaster.of(context).show(
                      ShadToast(
                        description: await ref.read(formProvider.notifier).submit() ? const Text("Datos enviados") : const Text("Error al enviar datos"),
                        action: ShadButton.destructive(
                          child: const Text("Cerrar"),
                          onPressed: () => ShadToaster.of(context).hide(),
                        ),
                      ),
                    );

                  }, child: const Text("Upload form"))

              ],
            ),
          ))

      ],
    ));
  }

}

