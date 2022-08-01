import 'package:get/get.dart';

import '../../modules/home_page/contains/settings/state_management/settings_controller_getx.dart';
import '../../modules/sign_up_page/contains/medical_info/state_management/medical_info_controller_getx.dart';
import '../../modules/sign_up_page/contains/personal_info/state_management/personal_info_controller_getx.dart';
import '../../modules/sign_up_page/contains/work_info/state_management/work_info_controller_getx.dart';
import '../const/text_style_manager.dart';
import '../localizations/localizations_controller/locale_getx.dart';
import 'upload_image_and_video_controller.dart';


class AppBindings extends Bindings{
  @override
  void dependencies() {

    Get.put(LocaleGetx());
    Get.put(SettingsControllerGetx());
    Get.lazyPut(() => UploadImageAndVideoController());
    Get.lazyPut(() => MedicalInfoControllerGetx());
    Get.lazyPut(() => PersonalInfoControllerGetx());
    Get.lazyPut(() => WorkInfoControllerGetx());
  }

}