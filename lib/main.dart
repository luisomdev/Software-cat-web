import 'package:flutter/material.dart';
import 'package:main/app/GUI/app.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://ufmgrefskiusafuchqgy.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVmbWdyZWZza2l1c2FmdWNocWd5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjQxODQwODEsImV4cCI6MjAzOTc2MDA4MX0.-A4p6KgE9mhfg7z43o7WefIbRLzrUXiGgpcVwegpCf0',
  );


  runApp( 
    const ProviderScope(
      child: MainApp(),
    )
  );
}

final supabase = Supabase.instance.client;

        
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const ShadApp.material(
      debugShowCheckedModeBanner: false,
      title: 'ShadCN UI Demo',
      home: AppEntryPoint(),
    );
  }
}
