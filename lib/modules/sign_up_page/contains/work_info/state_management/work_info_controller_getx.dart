
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/common/controller/upload_image_and_video_controller.dart';
import 'package:flutter_task/modules/sign_up_page/contains/work_info/const/work_info_text_key.dart';
import 'package:get/get.dart';

import '../model/clinic_model.dart';

class WorkInfoControllerGetx extends GetxController {
  final workInfoFormKey = GlobalKey<FormState>();
  RxString mainSpeciality = WorkInfoTextKey.selectYourSpeciality.obs;
  RxList<String> listMainSpeciality =
      <String>[WorkInfoTextKey.selectYourSpeciality].obs;

  RxString subSpeciality = WorkInfoTextKey.selectYourSubSpeciality.obs;
  RxList<String> listSubSpeciality =
      <String>[WorkInfoTextKey.selectYourSubSpeciality].obs;

  RxString scientificDegree = WorkInfoTextKey.selectYourScientificDegree.obs;
  RxList<String> listScientificDegree =
      <String>[WorkInfoTextKey.selectYourScientificDegree].obs;

  RxList<ClinicModel>? listOfClinicModel = <ClinicModel>[].obs;
  RxString clinicName = ''.obs;
  RxString clinicAddress = ''.obs;
  RxInt clinicPhone = 0.obs;

  RxString uploadCertificates = ''.obs;
  RxString uploadLicense = ''.obs;

  void changeMainSpeciality(String v) => mainSpeciality(v);

  void changeSubSpeciality(String v) => subSpeciality(v);

  void changeScientificDegree(String v) => scientificDegree(v);

  void changeUploadCertificates() async {
    final uploadImageAndVideoController =
        Get.find<UploadImageAndVideoController>();
    final file = await uploadImageAndVideoController.uploadImageOrVideo(
        fileType: FileType.image);
    uploadCertificates(file!.path);
  }

  void changeUploadLicense() async {
    final uploadImageAndVideoController =
        Get.find<UploadImageAndVideoController>();
    final file = await uploadImageAndVideoController.uploadImageOrVideo(
        fileType: FileType.image);
    uploadLicense(file!.path);
  }

  void changeClinicName(String v) => clinicName(v);

  void changeClinicAddress(String v) => clinicAddress(v);

  void changeClinicPhone(String v) => clinicPhone(int.parse(v));

  void addToListOfClinicModel() {
    final formState = workInfoFormKey.currentState;
    if (formState!.validate()) {
      formState.save();
      listOfClinicModel!.add(ClinicModel(
        name: clinicName.value,
        address: clinicAddress.value,
        phone: clinicPhone.value,
      ));
      formState.reset();
    }
  }
}
