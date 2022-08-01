import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../get_storage/get_storage_manager.dart';

class ThemeService {
  final getStorage = GetStorageManager.getStorage;

  ThemeMode getThemeMode() =>
      isSaveDarkMode() ? ThemeMode.dark : ThemeMode.light;

  bool isSaveDarkMode() =>
      getStorage.read(GetStorageManager.darkModeKey) ?? false;

  void saveThemeMode(bool isDarkMode) =>
      getStorage.write(GetStorageManager.darkModeKey, isDarkMode);

  void changeThemeMode(bool v) {
    Get.changeThemeMode(v ? ThemeMode.dark : ThemeMode.light);
    saveThemeMode(v);
  }
}
