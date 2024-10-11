import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;


final dataProvider = FutureProvider<List<dynamic>>((reft) async {

  final data = await supabase.from('gallery').select(); 
  return data;

});

