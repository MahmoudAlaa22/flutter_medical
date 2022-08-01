import 'dart:developer';

import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class UploadImageAndVideoController extends GetxController {

   Future<File?> uploadImageOrVideo({required FileType fileType}) async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: fileType);
      if (result != null) {
        return File(result.files.single.path!);
      }
    } catch (e) {
      throw Exception('Error in uploadImageOrVideo is $e');
    }

    return null;
  }
}
