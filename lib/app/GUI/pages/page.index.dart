import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class PageIndex extends StatelessWidget {
  PageIndex({super.key});

  final Uri _url = Uri.parse('https://flutter.dev');

  Future<void> _launchUrl() async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'No se pudo abrir $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShadCard(
                    width: 500,
                    title: const Text('Welcome to App cat random'),
                    description: const Text(
                        "Bienvenido al grupo de fuerzas especial de la OCP"),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20),
                      child: const ShadImage.square(
                        'assets/img/imagen2.svg',
                        size: 200,
                      ),
                    )),
                const SizedBox(height: 20),
                ShadCard(
                    width: 500,
                    child: Container(
                        alignment: Alignment.center,
                        child: Column(children: [
                          Container(
                            alignment: Alignment.center,
                            child: ShadButton.secondary(
                                width: double.infinity,
                                onPressed: () => _launchUrl(),
                                child: const Text(
                                    'Donar y valorar la aplicacion')),
                          ),
                        ])))
              ],
            )));
  }
}
