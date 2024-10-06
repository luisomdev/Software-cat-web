import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main/ui/bottom.dart';
import 'package:main/ui/settings.dart';
import 'package:main/ui/upload.dart';
import 'package:shadcn_ui/shadcn_ui.dart' as sd;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(counterProvider);

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [AppBody(), Upload(), Settings()],
      ),
      bottomNavigationBar: const Bottom(),
    );
  }
}

class AppBody extends StatelessWidget {
  const AppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            sd.ShadCard(
                width: 500,
                title: const Text('Welcome to App cat random'),
                description: const Text("Bienvenido al grupo de fuerzas especial de la OCP"),
                child: Container(alignment: Alignment.center, padding: const EdgeInsets.all(20),
                  child: SvgPicture.asset('assets/img/imagen2.svg', width: 400,),
                )

            ),
            SizedBox(height: 20),
            sd.ShadCard(
                width: 500,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      sd.ShadButton(
                        onPressed: () {}, child: const Text('Configuracion')),
                      sd.ShadButton.destructive(
                        onPressed: () {}, child: const Text('Reportar error')),

                  ],),
                    Container(
                      alignment: Alignment.center,
                      child: sd.ShadButton.secondary(
                        width: double.infinity,
                        onPressed: () {}, child: const Text('Donar y valorar la aplicacion')),
                    ),

                    ]
                  )
                )
            )

          ],
        ));
  }
}
