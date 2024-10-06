import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:main/ui/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp( const 
  ProviderScope(
    child: MainApp(),
  )
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const ShadApp.material(
      debugShowCheckedModeBanner: false,
      title: 'ShadCN UI Demo',
      home: App(),
    );
  }
}
