import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../get_storage/get_storage_manager.dart';

class LocaleGetx extends GetxController {
  final getStorage = GetStorageManager.getStorage;

  @override
  void onInit() {
    changeLang(hasLocale());
    super.onInit();
  }

  ///[changeLang] change language of app by give it value like => 'ar' Or 'en'.
  void changeLang(String codeLang) {
    saveLocale(codeLang);
    Get.updateLocale(Locale(codeLang));
  }

  String hasLocale() {
    return getStorage.read(GetStorageManager.languageKey) ?? 'en';
  }

  void saveLocale(String locale) {
    getStorage.write(GetStorageManager.languageKey, locale);
  }
}
