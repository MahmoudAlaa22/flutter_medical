
import 'package:flutter_task/common/theme/theme_service.dart';
import 'package:get/get.dart';

import '../../../../../common/localizations/localizations_controller/locale_getx.dart';

enum Language { english, arabic }

class SettingsControllerGetx extends GetxController {
  RxBool isDark = false.obs;
  Rx<Language> language = Language.english.obs;

  @override
  void onInit() {
    changeDarkMode(ThemeService().isSaveDarkMode());
    changeLanguage(
        LocaleGetx().hasLocale() == 'en' ? Language.english : Language.arabic);
    super.onInit();
  }

  void changeLanguage(Language v) {
    final localeGetx = Get.put(LocaleGetx());
    language(v);
    localeGetx.changeLang(v == Language.english ? 'en' : 'ar');
  }

  void changeDarkMode(bool v) {
    ThemeService().changeThemeMode(v);
    isDark(v);
  }
}
