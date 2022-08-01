
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/controller/upload_image_and_video_controller.dart';
import '../../home_page/home_page.dart';
import '../contains/personal_info/state_management/personal_info_controller_getx.dart';

class SignUpControllerGetx extends GetxController {
  RxString filePathImage = ''.obs;

  Future<void> addImageFromGallery() async {
    final uploadImageAndVideoController =
        Get.find<UploadImageAndVideoController>();
    final file = await uploadImageAndVideoController.uploadImageOrVideo(
        fileType: FileType.image);
    filePathImage(file!.path);
  }

  void signUp() {
    try {
      if (filePathImage.isNotEmpty) {
        if (validate()) {
          Get.toNamed(HomePage.routeName);
        } else {
          Get.snackbar('Error', 'You must verify the data entered.',
              colorText: Colors.white, backgroundColor: Colors.red);
        }
      } else {
        Get.snackbar('Error', 'You must Add image',
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } catch (e) {
      Get.snackbar('Error', '$e',
          colorText: Colors.white, backgroundColor: Colors.blue);
    }
  }

  bool validate() {
    final personalInfoControllerGetx = Get.find<PersonalInfoControllerGetx>();
    return personalInfoControllerGetx.validate();
  }

}
