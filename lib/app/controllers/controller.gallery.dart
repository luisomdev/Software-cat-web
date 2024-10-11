import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

final supabase = Supabase.instance.client;

class FormUploader extends StateNotifier<Map<String, dynamic>> {

  FormUploader() : super({
    'title': null,
    'description': null,
    'image': null,  
    'isSubmitting': false,
  });

  addTitle(String title) => state = {...state, 'title': title};
  addDescription(String description) => state = {...state, 'description': description};

  Future<void> uploadImage() async {

    if(await Permission.storage.request().isGranted) {
      
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowCompression: true,
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg'],
        withData: true,
      );

      if (result != null) {
        state = {...state, 'image': result, 'error': null};
      }

    }

  }


  // Enviar formulario
  Future<bool> submit() async {
    if (state['title'] == null || state['description'] == null || state['image'] == null) {
      state = {...state, 'error': 'Todos los campos son requeridos'};
      return false;
    }

    try {
      state = {...state, 'isSubmitting': true, 'error': null};

      //Subir imagen
      Uint8List? fileBytes = state['image'].files.first.bytes;

      if(fileBytes != null) {
        String namePath = state['image'].files.first.name;
        await supabase.storage.from('umbrella').uploadBinary(
          namePath,
          fileBytes,
          fileOptions: const FileOptions(upsert: true),
        );
      }

      String urlImg = supabase.storage.from('umbrella').getPublicUrl(state['image'].files.first.name);

      await supabase.from('gallery').insert(
        {
          'title': state['title'],
          'description': state['description'],
          'img': urlImg,
        }
      );
    
      state = {...state, 'isSubmitting': false};
      return true;
    } catch (e) {
      state = {...state, 'isSubmitting': false, 'error': e.toString()};
      return false;
    }
  }

}

final formProvider = StateNotifierProvider<FormUploader, Map<String, dynamic>>(
  (ref) => FormUploader(),
);
